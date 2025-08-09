import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:locket_clone/core/extension/context_extensions.dart';
import 'package:locket_clone/domain/entities/user_entity.dart';
import 'package:locket_clone/presentation/router/app_router.gr.dart';

class MessageItem extends StatelessWidget {
  final String latestMessage;
  final DateTime createdAt;
  final UserEntity receiver;
  const MessageItem({
    super.key,
    required this.latestMessage,
    required this.createdAt,
    required this.receiver,
  });

  @override
  Widget build(BuildContext context) {
    final UserEntity(:avatarUrl, :name) = receiver;
    return GestureDetector(
      onTap: () => context.router.push(MessageRoute(receiver: receiver)),
      child: SizedBox(
        width: context.screenWidth,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(backgroundImage: NetworkImage(avatarUrl ?? '')),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(name), Text(latestMessage)],
            ),
            Spacer(),
            Text('3w'),
          ],
        ),
      ),
    );
  }
}
