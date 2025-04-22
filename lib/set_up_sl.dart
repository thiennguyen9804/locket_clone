import 'package:get_it/get_it.dart';
import 'package:locket_clone/common/bloc/button/upload_img_cubit.dart';
import 'package:locket_clone/core/mapper/newsfeed_mapper/newsfeed_mapper.dart';
import 'package:locket_clone/core/mapper/post_mapper/post_mapper.dart';
import 'package:locket_clone/core/mapper/user_mapper/user_mapper.dart';
import 'package:locket_clone/core/network/dio_client.dart';
import 'package:locket_clone/data/app_database.dart';
import 'package:locket_clone/data/repository/post_repository_impl.dart';
import 'package:locket_clone/data/repository/user_repository_impl.dart' show UserRepositoryImpl;
import 'package:locket_clone/data/source/auth_local_service.dart';
import 'package:locket_clone/data/source/post_api_service.dart';
import 'package:locket_clone/data/source/user_api_service.dart';
import 'package:locket_clone/domain/repository/post_repository.dart';
import 'package:locket_clone/domain/repository/user_repository.dart';
import 'package:locket_clone/domain/usecases/get_current_user_use_case.dart';
import 'package:locket_clone/domain/usecases/login_user_use_case.dart';
import 'package:locket_clone/domain/usecases/upload_user_post_use_case.dart';

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
  // registerDatabase();
}

void registerUseCase() {
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<GetCurrentUserUseCase>(GetCurrentUserUseCase());
  sl.registerSingleton<LoginUserUseCase>(LoginUserUseCase());
  sl.registerSingleton<UploadUserPostUseCase>(UploadUserPostUseCase());
  // sl.registerSingleton<GetUserByIdUseCase>(GetUserByIdUseCase());
}

void registerRepository() {
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<PostRepository>(PostRepositoryImpl());
  sl.registerSingleton<UserRepository>(UserRepositoryImpl());
}

void registerService() {
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<AuthLocalService>(AuthLocalServiceImpl());
  sl.registerSingleton<PostApiService>(PostApiServiceImpl());
  sl.registerSingleton<UserApiService>(UserApiServiceImpl());
}

void registerDio() {
  sl.registerSingleton<DioClient>(DioClient());
}

void registerMappr() {
  sl.registerSingleton<UserMappr>(UserMappr());
  sl.registerSingleton<PostMappr>(PostMappr());
  sl.registerSingleton<NewsfeedMappr>(NewsfeedMappr());
}

void registerDatabase() {
  sl.registerSingleton<AppDatabase>(AppDatabase());
}