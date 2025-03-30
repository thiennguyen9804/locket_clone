import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:locket_clone/core/mapper/user_mapper/user_mapper.auto_mappr.dart';

import '../../../data/model/user_dto/user_dto.dart';
import '../../../domain/entities/user_entity.dart';

@AutoMappr([
  MapType<UserDto, UserEntity>(),
  MapType<UserEntity, UserDto>(), // Cho phép ánh xạ 2 chiều
])
class UserMappr extends $UserMappr {
  const UserMappr();
}
