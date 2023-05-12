import 'package:flutter/cupertino.dart';

import '../../domain/entities/post.dart';

abstract class PostLocalDataSource {
  Future<Post> getLastPost();
  Future<void> cachePost(Post post);
}
