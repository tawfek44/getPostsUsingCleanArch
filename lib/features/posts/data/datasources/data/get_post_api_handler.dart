import 'dart:io';
import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' show Client;
import 'api.dart';

class IgnoreCertHttpOverride extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}

@singleton
@preResolve
class GetPostApiHandler {
  GetPostApiHandler(
    this._api,
  );
  @factoryMethod
  static Future<GetPostApiHandler> create() async {
    HttpOverrides.global = IgnoreCertHttpOverride();
    final chopper = ChopperClient(
      baseUrl: Uri.parse('https://dummyjson.com'),
      services: [ApiService.create()],
      interceptors: [
        HttpLoggingInterceptor(),
      ],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      client: Client(),
    );
    return GetPostApiHandler(chopper.getService<ApiService>());
  }

  final ApiService _api;

  Future<Response> getPost() async {
    return _api.getPost();
  }
}
