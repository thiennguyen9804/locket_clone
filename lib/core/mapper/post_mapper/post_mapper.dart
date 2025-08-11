import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:locket_clone/core/mapper/interaction_mapper/interaction_mapper.dart';
import 'package:locket_clone/core/mapper/post_mapper/post_mapper.auto_mappr.dart';
import 'package:locket_clone/core/mapper/user_mapper/user_mapper.dart';
import 'package:locket_clone/data/model/post_dto/post_dto.dart';
import 'package:locket_clone/data/model/post_local_data.dart';
import 'package:locket_clone/domain/entities/post_entity.dart';
import 'package:locket_clone/domain/entities/user_entity.dart';
import 'package:locket_clone/domain/repository/user_repository.dart';
import 'package:locket_clone/set_up_sl.dart';

@AutoMappr(
  [MapType<PostDto, PostEntity>(reverse: true)],
  includes: [InteractionMapper()],
)
class PostMapper extends $PostMapper {
  const PostMapper();
}
