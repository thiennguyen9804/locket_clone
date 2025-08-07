import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:locket_clone/presentation/home/chat_screen/widget/chat_item.dart';

@RoutePage()
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  static const _avatar = 'https://i.pravatar.cc/300';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: context.router.pop,
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text('Tin nhắn'),
      ),
      body: SizedBox.expand(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          children: [
            MessageItem(
              id: 2,
              avatar: _avatar,
              name: 'Kiana',
              latestMessage: 'Hello Hayashing',
              createdAt: DateTime.now(),
            ),

            MessageItem(
              id: 2,
              avatar: _avatar,
              name: 'Kiana',
              latestMessage: 'Hello Hayashing',
              createdAt: DateTime.now(),
            ),
            MessageItem(
              id: 2,
              avatar: _avatar,
              name: 'Kiana',
              latestMessage: 'Hello Hayashing',
              createdAt: DateTime.now(),
            ),
          ],
        ),
      ),
    );
  }
}
