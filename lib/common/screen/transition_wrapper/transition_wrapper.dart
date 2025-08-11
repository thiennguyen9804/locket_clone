import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indexed/indexed.dart';
import 'package:locket_clone/common/screen/transition_wrapper/transition_helper.dart';
import 'package:locket_clone/common/widgets/anim_pressable.dart';
import 'package:locket_clone/data/source/auth_local_service.dart';
import 'package:locket_clone/domain/entities/post_entity.dart';
import 'package:locket_clone/presentation/home/camera_screen/camera_screen.dart';
import 'package:locket_clone/presentation/home/friend_screen/friend_screen.dart';
import 'package:locket_clone/presentation/home/message_screen/bloc/message_bloc.dart';
import 'package:locket_clone/presentation/home/message_screen/bloc/message_event.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/bloc/newsfeed_cubit.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/newsfeed_screen.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/newsfeed_screen_root.dart';
import 'package:locket_clone/presentation/router/app_router.gr.dart';

import 'package:locket_clone/core/configs/theme/app_theme.dart';
import 'package:locket_clone/domain/repository/post_repository.dart';
import 'package:locket_clone/set_up_sl.dart';

@RoutePage()
class TransitionWrapperScreen extends StatefulWidget
    implements AutoRouteWrapper {
  const TransitionWrapperScreen({super.key});

  @override
  State<TransitionWrapperScreen> createState() =>
      _TransitionWrapperScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsfeedCubit()..loadPosts()),
        BlocProvider(create: (context) => MessageBloc()),
      ],
      child: this,
    );
  }
}

class _TransitionWrapperScreenState extends State<TransitionWrapperScreen>
    with SingleTickerProviderStateMixin {
  late PostEntity post;

  final commentController = TextEditingController();

  final TransitionHelper _helperIst = TransitionHelper();
  final GlobalKey<CameraScreenState> cameraKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _helperIst.acceptCameraHandler(cameraKey.currentState?.cameraHandler);
  }

  void _onPostChanged(PostEntity post) {
    setState(() {
      this.post = post;
    });
  }

  Widget _avatar(VoidCallback onPress, String? imageUrl) {
    return AnimPressable(
      onTap: onPress,
      icon: Container(
        decoration: BoxDecoration(
          color: AppTheme.mainColor,
          borderRadius: BorderRadius.circular(100),
        ),
        width: 38,
        height: 38,
        padding: EdgeInsets.all(5),
        child:
            imageUrl != null
                ? CachedNetworkImage(
                  imageUrl: imageUrl,
                  imageBuilder:
                      (context, imageProvider) => Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                )
                : Icon(Icons.account_circle_outlined, color: Colors.white),
      ),
    );
  }

  void commentHandler() {
    context.read<MessageBloc>().add(
      SendMessageEvent(
        text: commentController.text,
        receiver: post.user,
        post: post,
      ),
    );
  }

  Widget _avatarBtn() {
    final userEntity = sl<AuthLocalService>().getLocalCurrentUser();
    return _avatar(() {
      context.router.push(UserInfoRoute());
    }, userEntity.avatarUrl);
  }

  Widget _friendBtn() {
    return ValueListenableBuilder(
      valueListenable: _helperIst.isInCameraNotifier,
      builder: (context, value, child) {
        if (value) {
          return ElevatedButton(
            onPressed: openFriendScreen,
            style: ElevatedButton.styleFrom(elevation: 3),
            child: Row(
              children: [
                Icon(Icons.people, color: Colors.white, size: 20),
                SizedBox(width: 12),
                Text('1 Bạn bè', style: TextStyle().copyWith()),
              ],
            ),
          );
        } else {
          return ElevatedButton(
            onPressed: openFriendScreen,
            style: ElevatedButton.styleFrom(elevation: 3),
            child: Row(
              children: [
                Icon(Icons.people, color: Colors.white, size: 20),
                SizedBox(width: 12),
                Text('Tất cả bạn bè', style: TextStyle().copyWith()),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _chatBtn() {
    return IconButton(
      onPressed: () {
        context.router.push(ChatRoute());
      },
      color: Colors.white,
      icon: Icon(Icons.chat, size: 20),
      style: IconButton.styleFrom(backgroundColor: AppTheme.mainColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ValueListenableBuilder(
        valueListenable: _helperIst.lockedNotifier,
        builder: (context, locked, child) {
          return Indexer(
            children: [
              Indexed(
                index: 1,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 38.0,
                      right: 38.0,
                      top: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [_avatarBtn(), _friendBtn(), _chatBtn()],
                    ),
                  ),
                ),
              ),
              Indexed(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        Color(0xff738F81),
                        Color.fromRGBO(115, 143, 129, 0.46),
                        Color(0x00ffffff),
                      ],
                      stops: [0.0, 0.44, 1.0],
                      radius: 1,
                    ),
                  ),
                  child: PageView(
                    physics:
                        locked
                            ? const NeverScrollableScrollPhysics()
                            : const ClampingScrollPhysics(),
                    controller: _helperIst.mainController,
                    scrollDirection: Axis.vertical,
                    children: [
                      AutoRouter(), // Home Root goes here
                      // LegacyCameraScreen(),
                      NewsfeedScreenRoot(
                        onPostChanged: _onPostChanged,
                        commentController: commentController,
                        commentHandler: commentHandler,
                        emojiSelectedHandler: emojiSelectedHandler,
                        child: NewsfeedScreen(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  void openFriendScreen() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xffAAC2B3),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: FriendScreen(),
        );
      },
    );
  }

  void emojiSelectedHandler(Emoji emoji) {
    sl<PostRepository>().react(postId: post.id, emoji: emoji.emoji);
  }
}
