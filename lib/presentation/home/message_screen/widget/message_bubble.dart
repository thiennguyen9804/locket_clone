import 'package:flutter/material.dart';
import 'package:locket_clone/data/model/message_dto/message_dto.dart';
import 'package:locket_clone/data/source/auth_local_service.dart';
import 'package:locket_clone/set_up_sl.dart';

class MessageBubble extends StatelessWidget {
  final MessageDto message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isMine =
        message.sender.id == sl<AuthLocalService>().getLocalCurrentUser().id;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isMine ? Colors.blue[200] : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(message.text),
    );
  }
}
