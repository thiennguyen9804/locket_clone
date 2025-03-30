import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:locket_clone/data/model/user_dto/user_dto.dart';

part 'post_dto.g.dart';

part 'post_dto.freezed.dart';

@freezed
class PostDto with _$PostDto {
  const factory PostDto({
    required int id,
    required String imageUrl,
    required UserDto user,
    required String caption,
    required dynamic interactionList,
    required DateTime createdAt,
  }) = _PostDto;

  factory PostDto.fromJson(Map<String, Object?> json) =>
      _$PostDtoFromJson(json);
}
