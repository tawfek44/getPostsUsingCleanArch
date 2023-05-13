import 'package:task/features/posts/data/models/post_model.dart';

import '../../domain/entities/post.dart';

abstract class PostRemoteDataSource {
  Future<PostModel> getPosts();
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  @override
  Future<PostModel> getPosts() {
    // TODO: implement getPosts
    throw UnimplementedError();
  }
}
