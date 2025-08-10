import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:locket_clone/data/model/message_dto/message_dto.dart';
import 'package:locket_clone/data/model/user_dto/user_dto.dart';
import 'package:locket_clone/data/source/auth_local_service.dart';
import 'package:locket_clone/domain/entities/user_entity.dart';
import 'package:locket_clone/domain/repository/auth_repository.dart';
import 'package:locket_clone/presentation/home/message_screen/bloc/message_bloc.dart';
import 'package:locket_clone/presentation/home/message_screen/bloc/message_event.dart';
import 'package:locket_clone/presentation/home/message_screen/widget/message_bubble.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/widget/comment_input.dart';
import 'package:locket_clone/set_up_sl.dart';

@RoutePage()
class MessageScreen extends StatelessWidget implements AutoRouteWrapper {
  final controller = TextEditingController();

  final UserEntity receiver;

  MessageScreen({super.key, required this.receiver});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: context.router.pop,
          icon: Icon(Icons.arrow_back_ios_outlined),
        ),
        title: Text(receiver.name),
      ),
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
                        FetchNextMessagesPage(receiver),
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
      SendMessageEvent(receiver: receiver, text: controller.text),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (context) => MessageBloc(), child: this);
  }
}
