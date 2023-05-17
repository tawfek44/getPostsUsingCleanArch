import 'package:chopper/chopper.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/core/network/network_state.dart';
import 'package:task/features/posts/data/datasources/data/api.dart';
import 'package:task/features/posts/data/datasources/post_local_data_source.dart';
import 'package:task/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:task/features/posts/data/repositories/posts_repository_impl.dart';
import 'package:task/features/posts/domain/repositories/get_posts_repository.dart';
import 'package:task/features/posts/presentation/bloc/get_post_cubit.dart';

import '../../features/posts/data/datasources/data/get_post_api_handler.dart';
import '../../features/posts/domain/usecases/get_posts.dart';

final sl = GetIt.instance;

Future<void> configureInjection() async {
  //Bloc
  sl.registerFactory(() => GetPostCubit(sl()));

  //UseCases
  sl.registerLazySingleton(() => GetPostsUseCase(sl()));

  //Repository
  sl.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(
      postRemoteDataSource: sl(),
      postLocalDataSource: sl(),
      networkInfo: sl()));

  //Data Sources

  sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl(sl()));

  sl.registerLazySingleton<PostLocalDataSource>(
      () => PostLocalDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //External
  final sharedPreference = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() async => sharedPreference);

  sl.registerLazySingleton(() => const ChopperApi());
  sl.registerLazySingleton(() => GetPostApiHandler(sl()));

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
