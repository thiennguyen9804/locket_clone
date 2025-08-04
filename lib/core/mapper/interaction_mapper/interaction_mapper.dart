import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:locket_clone/core/mapper/interaction_mapper/interaction_mapper.auto_mappr.dart';
import 'package:locket_clone/core/mapper/user_mapper/user_mapper.dart';
import 'package:locket_clone/data/model/interaction_dto/interaction_dto.dart';
import 'package:locket_clone/domain/entities/interaction_entity.dart';

@AutoMappr(
  [MapType<InteractionDto, InteractionEntity>(reverse: true)],
  includes: [UserMapper()],
)
class InteractionMapper extends $InteractionMapper {
  const InteractionMapper();
}
