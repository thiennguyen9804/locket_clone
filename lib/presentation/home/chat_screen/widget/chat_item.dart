import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.avatar,
    required this.name,
    required this.latestMessage,
    required this.createdAt,
  });
  final String avatar;
  final String name;
  final String latestMessage;
  final DateTime createdAt;

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(child: CachedNetworkImage(imageUrl: avatar)),
          Column(children: [Text(name), Text(latestMessage)]),
          Spacer(),
          Text('3w'),
        ],
      ),
    );
  }
}
