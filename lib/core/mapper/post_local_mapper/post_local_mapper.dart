import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:locket_clone/data/model/post_dto/post_dto.dart';
import 'package:locket_clone/data/model/post_local_data.dart';
import 'package:locket_clone/data/model/user_dto/user_dto.dart';
import 'package:locket_clone/domain/entities/post_entity.dart';

// @AutoMappr([
//   MapType<PostEntity, PostLocalData>(
//     fields: [Field.custom('userId', custom: PostLocalMapper.userDtoToInt)],
//   ),
// ])
// class PostLocalMapper extends $PostLocalMapper {
//   const PostLocalMapper();
//   static int userDtoToInt(PostEntity post) {
//     return post.user.id;
//   }
// }
