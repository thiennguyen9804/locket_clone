import 'package:locket_clone/data/model/message_dto/message_dto.dart';
import 'package:locket_clone/domain/entities/user_entity.dart';

sealed class MessageEvent {}

final class FetchNextMessagesPage extends MessageEvent {
  final UserEntity receiver;

  FetchNextMessagesPage(this.receiver);
}

final class SendMessageEvent extends MessageEvent {
  final String text;
  final String? imageUrl;
  final UserEntity receiver;

  SendMessageEvent({required this.receiver, required this.text, this.imageUrl});
}

final class AddNewMessageEvent extends MessageEvent {
  final MessageDto newMessage;

  AddNewMessageEvent(this.newMessage);
}
