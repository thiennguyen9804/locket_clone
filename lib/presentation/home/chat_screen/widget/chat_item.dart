import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:locket_clone/core/extension/context_extensions.dart';
import 'package:locket_clone/presentation/router/app_router.gr.dart';

class MessageItem extends StatelessWidget {
  final String avatar;
  final String name;
  final String latestMessage;
  final DateTime createdAt;
  final int id;
  const MessageItem({
    super.key,
    required this.avatar,
    required this.name,
    required this.latestMessage,
    required this.createdAt,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(MessageRoute(receiverId: id)),
      child: SizedBox(
        width: context.screenWidth,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(child: CachedNetworkImage(imageUrl: avatar)),
            Column(children: [Text(name), Text(latestMessage)]),
            Spacer(),
            Text('3w'),
          ],
        ),
      ),
    );
  }
}
