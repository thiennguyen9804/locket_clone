import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:locket_clone/domain/entities/user_entity.dart';
import 'package:locket_clone/presentation/home/chat_screen/widget/chat_item.dart';

final _user2 = UserEntity(
  id: 2,
  name: 'Kiana',
  avatarUrl: 'https://i.pravatar.cc/301',
  email: 'kiana@example.com',
  phoneNumber: '111111111',
);

@RoutePage()
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

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
              receiver: _user2,
              latestMessage: 'Hello Hayashing',
              createdAt: DateTime.now(),
            ),

            MessageItem(
              receiver: _user2,
              latestMessage: 'Hello Hayashing',
              createdAt: DateTime.now(),
            ),
            MessageItem(
              receiver: _user2,
              latestMessage: 'Hello Hayashing',
              createdAt: DateTime.now(),
            ),
          ],
        ),
      ),
    );
  }
}
