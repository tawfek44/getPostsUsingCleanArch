import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task/features/posts/data/datasources/data/get_post_api_handler.dart';
import 'package:task/features/posts/data/models/post_model.dart';

import '../../domain/entities/post.dart';

abstract class PostRemoteDataSource {
  Future<PostModel> getPosts();
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  PostRemoteDataSourceImpl(
    this._api,
  );
  final GetPostApiHandler _api;

  @override
  Future<PostModel> getPosts() async {
    final response = await _api.getPost();
    return PostModel.fromJson(json.decode(response.body));
  }
}
