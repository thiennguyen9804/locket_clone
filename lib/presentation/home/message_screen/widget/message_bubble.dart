import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:locket_clone/core/extension/context_extensions.dart';
import 'package:locket_clone/data/model/message_dto/message_dto.dart';
import 'package:locket_clone/data/source/auth_local_service.dart';
import 'package:locket_clone/presentation/home/camera_screen/widget/locket_frame_box.dart';
import 'package:locket_clone/set_up_sl.dart';

class MessageBubble extends StatelessWidget {
  final MessageDto message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final frameSize = context.screenWidth * 0.7;
    final isMine =
        message.sender.id == sl<AuthLocalService>().getLocalCurrentUser().id;
    final MessageDto(:post) = message;
    return Column(
      crossAxisAlignment:
          isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (post != null)
          LocketFramedBox(
            width: frameSize,
            height: frameSize,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(post.user.name),
                ),
                CachedNetworkImage(imageUrl: post.imageUrl),
              ],
            ),
          ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isMine ? Colors.blue[200] : Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(message.text),
        ),
      ],
    );
  }
}
