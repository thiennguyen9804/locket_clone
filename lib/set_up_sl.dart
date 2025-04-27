import 'package:get_it/get_it.dart';
import 'package:locket_clone/common/bloc/button/upload_img_cubit.dart';
import 'package:locket_clone/core/mapper/newsfeed_mapper/newsfeed_mapper.dart';
import 'package:locket_clone/core/mapper/post_local_mapper/post_local_mapper.dart';
import 'package:locket_clone/core/mapper/post_mapper/post_mapper.dart';
import 'package:locket_clone/core/mapper/user_mapper/user_mapper.dart';
import 'package:locket_clone/core/network/dio_client.dart';
import 'package:locket_clone/data/app_database.dart';
import 'package:locket_clone/data/repository/post_repository_impl.dart';
import 'package:locket_clone/data/repository/user_repository_impl.dart' show UserRepositoryImpl;
import 'package:locket_clone/data/source/auth_local_service.dart';
import 'package:locket_clone/data/source/post_api_service.dart';
import 'package:locket_clone/data/source/post_local_service.dart';
import 'package:locket_clone/data/source/user_api_service.dart';
import 'package:locket_clone/data/source/user_local_service.dart';
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

Future setUpSl() async {
  registerDio();
  registerRepository();
  registerService();
  registerUseCase();
  registerMapper();
  // registerDatabase();
  await sl.allReady();
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
  sl.registerSingletonAsync<PostLocalService>(() async {
    final db = await AppDatabase().database;
    return PostLocalServiceImpl(db);
  });
  sl.registerSingletonAsync<UserLocalService>(() async {
    final db = await AppDatabase().database;
    return UserLocalServiceImpl(db);
  });
}

void registerDio() {
  sl.registerSingleton<DioClient>(DioClient());
}

void registerMapper() {
  sl.registerSingleton<UserMapper>(UserMapper());
  sl.registerSingleton<PostMapper>(PostMapper());
  sl.registerSingleton<NewsfeedMapper>(NewsfeedMapper());
}

void registerDatabase() {
  sl.registerSingleton<AppDatabase>(AppDatabase());
}