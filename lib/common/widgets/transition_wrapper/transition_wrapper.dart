import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:emoji_picker_flutter/src/emoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indexed/indexed.dart';
import 'package:locket_clone/common/widgets/anim_pressable.dart';
import 'package:locket_clone/common/widgets/transition_wrapper/transition_helper.dart';
import 'package:locket_clone/presentation/home/friend_screen/friend_screen.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/bloc/newsfeed_cubit.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/newsfeed_screen.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/newsfeed_screen_root.dart';
import 'package:locket_clone/presentation/home/user_info_screen/user_info_screen.dart';

import '../../../core/configs/theme/app_theme.dart';
import '../../../domain/repository/post_repository.dart';
import '../../../presentation/home/bloc/user_cubit.dart';
import '../../../set_up_sl.dart';

@RoutePage()
class TransitionWrapperScreen extends StatefulWidget {
  const TransitionWrapperScreen({super.key});

  @override
  State<TransitionWrapperScreen> createState() =>
      _TransitionWrapperScreenState();
}

class _TransitionWrapperScreenState extends State<TransitionWrapperScreen>
    with SingleTickerProviderStateMixin {
  ScrollPhysics get currentScrollPhysics =>
      _locked
          ? const NeverScrollableScrollPhysics()
          : const ClampingScrollPhysics();

  final bool _locked = false;
  late int _postId;

  final commentController = TextEditingController();

  final TransitionHelper _helperIst = TransitionHelper();
  @override
  void initState() {
    super.initState();
  }

  void _onPostChanged(int postId) {
    setState(() {
      _postId = postId;
    });
    debugPrint("🔥 Current post ID in wrapper: $postId");
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

  Widget _avatarBtn(VoidCallback onPress) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return switch (state) {
          UserLoading() || UserLoadedFail() => Container(
            decoration: BoxDecoration(
              color: AppTheme.mainColor,
              borderRadius: BorderRadius.circular(100),
            ),
            width: 38,
            height: 38,
            padding: EdgeInsets.all(5),
            child: Icon(Icons.account_circle_outlined, color: Colors.white),
          ),
          UserLoadedSuccess() => _avatar(() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserInfoScreen()),
            );
          }, state.userEntity.avatarUrl),
        };
      },
    );
  }

  void commentHandler() {}

  Widget _friendBtn(VoidCallback onPress) {
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
  }

  Widget _chatBtn(VoidCallback onPress) {
    return IconButton(
      onPressed: onPress,
      color: Colors.white,
      icon: Icon(Icons.chat, size: 20),
      style: IconButton.styleFrom(backgroundColor: AppTheme.mainColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ValueListenableBuilder(
        valueListenable: _helperIst.lockedNotifier,
        builder: (context, locked, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => UserCubit()..getCurrentUser()),
              BlocProvider(create: (context) => NewsfeedCubit()..loadPosts()),
            ],
            child: BlocListener<UserCubit, UserState>(
              listener: (context, state) {
                switch (state) {
                  case UserLoading():
                    {}
                  case UserLoadedSuccess():
                    {}
                  case UserLoadedFail():
                    Fluttertoast.showToast(msg: state.errorMsg);
                }
              },
              child: Indexer(
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
                          children: [
                            _avatarBtn(() {}),
                            _friendBtn(() {}),
                            _chatBtn(() {}),
                          ],
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
              ),
            ),
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
    debugPrint('react to postid: $_postId with emoji: ${emoji.emoji}');
    sl<PostRepository>().react(postId: _postId, emoji: emoji.emoji);
  }
}
