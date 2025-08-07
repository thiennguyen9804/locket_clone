import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:locket_clone/data/model/user_dto/user_dto.dart';

part 'message_dto.freezed.dart';
part 'message_dto.g.dart';

@freezed
class MessageDto with _$MessageDto {
  const factory MessageDto({
    required String text,
    String? imageUrl,
    required UserDto sender,
    required UserDto receiver,
    required DateTime createdAt,
  }) = _MessageDto;

  factory MessageDto.fromJson(Map<String, dynamic> json) =>
      _$MessageDtoFromJson(json);
}
