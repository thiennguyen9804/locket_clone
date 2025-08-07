import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:locket_clone/data/model/message_dto/message_dto.dart';
import 'package:locket_clone/data/model/user_dto/user_dto.dart';
import 'package:locket_clone/data/source/auth_local_service.dart';
import 'package:locket_clone/domain/repository/auth_repository.dart';
import 'package:locket_clone/presentation/home/message_screen/widget/message_bubble.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/widget/comment_input.dart';
import 'package:locket_clone/set_up_sl.dart';

final _user1 = UserDto(
  id: 1,
  name: 'Hayashing',
  avatarUrl: 'https://i.pravatar.cc/300',
  email: 'hayashing@example.com',
  phoneNumber: '000000000',
);

final _user2 = UserDto(
  id: 2,
  name: 'Kiana',
  avatarUrl: 'https://i.pravatar.cc/301',
  email: 'kiana@example.com',
  phoneNumber: '111111111',
);

final _messages = <MessageDto>[
  MessageDto(
    text: 'Hey Kiana!',
    imageUrl: null,
    sender: _user1,
    receiver: _user2,
    createdAt: DateTime.now().subtract(Duration(minutes: 3)),
  ),
  MessageDto(
    text: 'Hey Hayashing, how are you?',
    imageUrl: null,
    sender: _user2,
    receiver: _user1,
    createdAt: DateTime.now().subtract(Duration(minutes: 2)),
  ),
  MessageDto(
    text: 'I just sent you a picture!',
    imageUrl: 'https://example.com/image.jpg',
    sender: _user1,
    receiver: _user2,
    createdAt: DateTime.now().subtract(Duration(minutes: 1)),
  ),
];

@RoutePage()
class MessageScreen extends StatelessWidget {
  MessageScreen({super.key, required this.receiverId});

  final controller = TextEditingController();
  void chatHandler() {}
  final int receiverId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                // reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final msg = _messages[index];

                  final isMine =
                      msg.sender.id ==
                      sl<AuthLocalService>().getLocalCurrentUser().id;
                  return Align(
                    alignment:
                        isMine ? Alignment.centerRight : Alignment.centerLeft,
                    child: MessageBubble(message: msg),
                  );
                },
              ),
            ),

            CommentInput(
              autoFocus: false,
              commentController: controller,
              commentHandler: chatHandler,
            ),
          ],
        ),
      ),
    );
  }
}
