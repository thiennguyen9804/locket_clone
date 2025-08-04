import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:locket_clone/data/model/user_dto/user_dto.dart';

part 'interaction_dto.freezed.dart';
part 'interaction_dto.g.dart';

@freezed
class InteractionDto with _$InteractionDto {
  const factory InteractionDto({
    required int id,
    required UserDto user,
    required int postId,
    required String emoji,
  }) = _InteractionDto;

  factory InteractionDto.fromJson(Map<String, dynamic> json) =>
      _$InteractionDtoFromJson(json);
}
