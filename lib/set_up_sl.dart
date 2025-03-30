import 'package:get_it/get_it.dart';
import 'package:locket_clone/core/mapper/newsfeed_mapper/newsfeed_mapper.dart';
import 'package:locket_clone/core/mapper/post_mapper/post_mapper.dart';
import 'package:locket_clone/core/mapper/user_mapper/user_mapper.dart';
import 'package:locket_clone/core/network/dio_client.dart';
import 'package:locket_clone/data/repository/post_repository_impl.dart';
import 'package:locket_clone/data/source/auth_local_service.dart';
import 'package:locket_clone/data/source/post_api_service.dart';
import 'package:locket_clone/domain/repository/post_repository.dart';
import 'package:locket_clone/domain/usecases/get_current_user_use_case.dart';
import 'package:locket_clone/domain/usecases/login_user_use_case.dart';

import 'data/repository/auth_repository_impl.dart';
import 'data/source/auth_api_service.dart';
import 'domain/repository/auth_repository.dart';
import 'domain/usecases/sign_in_use_case.dart';

GetIt sl = GetIt.instance;

void setUpSl() {
  registerDio();
  registerRepository();
  registerService();
  registerUseCase();
  registerMappr();
}

void registerUseCase() {
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<GetCurrentUserUseCase>(GetCurrentUserUseCase());
  sl.registerSingleton<LoginUserUseCase>(LoginUserUseCase());
  // sl.registerSingleton<GetUserByIdUseCase>(GetUserByIdUseCase());
}

void registerRepository() {
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<PostRepository>(PostRepositoryImpl());
}

void registerService() {
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<AuthLocalService>(AuthLocalServiceImpl());
  sl.registerSingleton<PostApiService>(PostApiServiceImpl());
}

void registerDio() {
  sl.registerSingleton<DioClient>(DioClient());
}

void registerMappr() {
  sl.registerSingleton<UserMappr>(UserMappr());
  sl.registerSingleton<PostMappr>(PostMappr());
  sl.registerSingleton<NewsfeedMappr>(NewsfeedMappr());
}
