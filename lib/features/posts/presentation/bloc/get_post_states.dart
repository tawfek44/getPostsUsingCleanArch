part of 'get_post_cubit.dart';

@freezed
class GetPostState with _$GetPostState {
  const factory GetPostState.initial() = _Initial;
  const factory GetPostState.loading() = LoadingGetPostState;
  const factory GetPostState.loaded(Either<Failure, Post> post) =
      LoadedGetPostState;
  const factory GetPostState.error(Object e) = ErrorGetPostState;
}
