import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task/features/posts/data/datasources/data/get_post_api_handler.dart';
import 'package:task/features/posts/domain/entities/post.dart';
import 'package:task/features/posts/domain/repositories/get_posts_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetPostsUseCase implements UseCase<Post, NoParams> {
  final PostRepository postRepository;

  GetPostsUseCase(
    this.postRepository,
  );

  @override
  Future<Either<Failure, Post>> call(NoParams params) async {
    return await postRepository.getPosts();
  }
}
