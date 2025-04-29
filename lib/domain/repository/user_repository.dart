import 'package:locket_clone/data/model/user_dto/user_dto.dart';
import 'package:locket_clone/domain/entities/user_entity.dart';
import 'package:locket_clone/presentation/data/upload_post.dart';

abstract class UserRepository {
  // Future writeUserToLocal(UserEntity user);
  Future resetTable();
  Future<UserEntity> getLocalUserById(int id);
}

