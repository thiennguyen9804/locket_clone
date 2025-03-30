import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:locket_clone/core/mapper/post_mapper/post_mapper.auto_mappr.dart';
import 'package:locket_clone/core/mapper/user_mapper/user_mapper.dart';
import 'package:locket_clone/data/model/post_dto/post_dto.dart';
import 'package:locket_clone/domain/entities/post_entity.dart';

@AutoMappr([
  MapType<PostDto, PostEntity>(),
  MapType<PostEntity, PostDto>(), // Cho phép ánh xạ 2 chiều
], includes: [
  UserMappr()
])
class PostMappr extends $PostMappr {
  const PostMappr();
}
