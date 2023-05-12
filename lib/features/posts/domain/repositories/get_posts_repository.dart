import 'package:dartz/dartz.dart';
import 'package:task/features/posts/domain/entities/post.dart';

import '../../../../core/error/failures.dart';

abstract class PostRepository {
  Future<Either<Failure, Post>> getPosts();
}
