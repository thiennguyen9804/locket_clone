import 'package:locket_clone/core/mapper/user_mapper/user_mapper.dart';
import 'package:locket_clone/data/model/user_dto/user_dto.dart';
import 'package:locket_clone/data/source/auth_local_service.dart';
import 'package:locket_clone/data/source/user_api_service.dart';
import 'package:locket_clone/data/source/user_local_service.dart';
import 'package:locket_clone/domain/entities/user_entity.dart';
import 'package:locket_clone/domain/repository/auth_repository.dart';
import 'package:locket_clone/domain/repository/user_repository.dart';
import 'package:locket_clone/presentation/data/upload_post.dart';
import 'package:locket_clone/set_up_sl.dart';

class UserRepositoryImpl implements UserRepository {
  // @override
  // Future writeUserToLocal(UserEntity user) {
  //   throw UnimplementedError();
  // }
  
  @override
  Future resetTable() async {
    await sl<UserLocalService>().resetTable();
  }
  
  @override
  Future<UserEntity> getLocalUserById(int id) async {
    final res = await sl<UserLocalService>().getLocalUserById(id);
    return sl<UserMapper>().convert<UserDto, UserEntity>(res);    
  }
  

}