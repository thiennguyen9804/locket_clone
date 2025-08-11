import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:locket_clone/core/mapper/user_mapper/user_mapper.dart';
import 'package:locket_clone/data/model/message_dto/message_dto.dart';
import 'package:locket_clone/data/model/user_dto/user_dto.dart';
import 'package:locket_clone/data/source/auth_local_service.dart';
import 'package:locket_clone/data/source/message_api_service.dart';
import 'package:locket_clone/domain/entities/user_entity.dart';
import 'package:locket_clone/presentation/home/chat_screen/widget/chat_item.dart';
import 'package:locket_clone/set_up_sl.dart';

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
      body: FutureBuilder(
        future: sl<MessageApiService>().getAllMessages(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final messageList = asyncSnapshot.data!;

          return SizedBox.expand(
            child: ListView.builder(
              itemCount: messageList.length,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemBuilder: (context, index) {
                final MessageDto(:text, :sender, :receiver, :createdAt) =
                    messageList[index];
                final currentUser =
                    sl<AuthLocalService>().getLocalCurrentUser();
                final trueReceiver = sl<UserMapper>()
                    .convert<UserDto, UserEntity>(
                      sender.id == currentUser.id ? receiver : sender,
                    );
                return MessageItem(
                  latestMessage: text,
                  createdAt: createdAt,
                  receiver: trueReceiver,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
