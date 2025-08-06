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
        child: PageView(
          children: [
            ChatItem(
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
