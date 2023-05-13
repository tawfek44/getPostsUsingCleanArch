import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/core/error/exceptions.dart';
import 'package:task/features/posts/data/models/post_model.dart';

import '../../domain/entities/post.dart';

abstract class PostLocalDataSource {
  Future<PostModel> getLastPost();
  Future<void> cachePost(PostModel post);
}

class PostLocalDataSourceImpl implements PostLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<PostModel> getLastPost() {
    final jsonString = sharedPreferences.getString('Cached_Post');
    if (jsonString != null) {
      return Future.value(PostModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cachePost(PostModel post) async {
    sharedPreferences.setString('Cached_Post', json.encode(post.toJson()));
  }
}
