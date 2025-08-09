import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:locket_clone/data/model/post_dto/post_dto.dart';

part 'send_message_dto.g.dart';
part 'send_message_dto.freezed.dart';

@freezed
class SendMessageDto with _$SendMessageDto {
  const factory SendMessageDto({
    required String text,
    required int receiverId,
    PostDto? post,
  }) = _SendMessageDto;

  factory SendMessageDto.fromJson(Map<String, Object?> json) =>
      _$SendMessageDtoFromJson(json);
}
