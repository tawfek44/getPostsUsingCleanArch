import '../../domain/entities/post.dart';

abstract class PostRemoteDataSource {
  Future<Post> getPosts();
}
