import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:locket_clone/data/model/message_dto/message_dto.dart';
import 'package:locket_clone/data/model/user_dto/user_dto.dart';
import 'package:locket_clone/data/source/auth_local_service.dart';
import 'package:locket_clone/domain/repository/auth_repository.dart';
import 'package:locket_clone/presentation/home/message_screen/bloc/message_bloc.dart';
import 'package:locket_clone/presentation/home/message_screen/bloc/message_event.dart';
import 'package:locket_clone/presentation/home/message_screen/widget/message_bubble.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/widget/comment_input.dart';
import 'package:locket_clone/set_up_sl.dart';

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

@RoutePage()
class MessageScreen extends StatelessWidget implements AutoRouteWrapper {
  final controller = TextEditingController();

  final int receiverId;
  MessageScreen({super.key, required this.receiverId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<MessageBloc, PagingState<int, MessageDto>>(
                builder: (context, state) {
                  return PagedListView(
                    reverse: true,
                    state: state,
                    fetchNextPage: () async {
                      context.read<MessageBloc>().add(
                        FetchNextMessagesPage(receiverId),
                      );
                    },
                    builderDelegate: PagedChildBuilderDelegate<MessageDto>(
                      itemBuilder: (context, item, index) {
                        final isMine =
                            item.sender.id ==
                            sl<AuthLocalService>().getLocalCurrentUser().id;
                        return Align(
                          alignment:
                              isMine
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                          child: MessageBubble(message: item),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            CommentInput(
              autoFocus: false,
              commentController: controller,
              commentHandler: () => chatHandler(context),
            ),
          ],
        ),
      ),
    );
  }

  void chatHandler(BuildContext context) {
    context.read<MessageBloc>().add(
      SendMessageEvent(receiverId: receiverId, text: controller.text),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (context) => MessageBloc(), child: this);
  }
}
