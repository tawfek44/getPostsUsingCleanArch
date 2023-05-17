import 'package:chopper/chopper.dart';
part 'api.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  static ApiService create([ChopperClient? client]) => _$ApiService(client);

  @Get(path: 'https://dummyjson.com/posts')
  Future<Response> getPost();
}
