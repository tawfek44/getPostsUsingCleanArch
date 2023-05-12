import 'package:dartz/dartz.dart';
import 'package:task/core/error/exceptions.dart';
import 'package:task/core/network/network_state.dart';
import 'package:task/features/posts/data/datasources/post_local_data_source.dart';
import 'package:task/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:task/features/posts/domain/entities/post.dart';
import 'package:task/features/posts/domain/repositories/get_posts_repository.dart';

import '../../../../core/error/failures.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource postRemoteDataSource;
  final PostLocalDataSource postLocalDataSource;
  final NetworkInfo networkInfo;

  PostRepositoryImpl(
      {required this.postRemoteDataSource,
      required this.postLocalDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, Post>> getPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final posts = await postRemoteDataSource.getPosts();
        postLocalDataSource.cachePost(posts);
        return Right(posts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final posts = await postLocalDataSource.getLastPost();
        return Right(posts);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
