import 'package:locket_clone/domain/entities/post_entity.dart';
import 'package:locket_clone/domain/entities/user_entity.dart';

class MessageEntity {
  final String text;
  final PostEntity? post;
  final UserEntity sender;
  final UserEntity receiver;
  final DateTime createdAt;

  MessageEntity({
    required this.text,
    this.post,
    required this.sender,
    required this.receiver,
    required this.createdAt,
  });

  @override
  String toString() {
    return 'MessageEntity(text: $text, post: $post, sender: $sender, receiver: $receiver, createdAt: $createdAt)';
  }
}
