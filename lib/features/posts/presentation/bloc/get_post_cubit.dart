import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/error/failures.dart';
import 'package:task/core/usecases/usecase.dart';

import '../../domain/entities/post.dart';
import '../../domain/usecases/get_posts.dart';

part 'get_post_states.dart';
part 'get_post_cubit.freezed.dart';

@injectable
class GetPostCubit extends Cubit<GetPostState> {
  GetPostCubit(this.getPostsUseCase) : super(const GetPostState.initial());

  final GetPostsUseCase getPostsUseCase;

  Future<void> getPosts() async {
    try {
      emit(const GetPostState.loading());
      final post = await getPostsUseCase(NoParams as NoParams);
      emit(GetPostState.loaded(post));
    } catch (e) {
      emit(GetPostState.error(e));
    }
  }
}
