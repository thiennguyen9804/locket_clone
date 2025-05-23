import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indexed/indexed.dart';
import 'package:locket_clone/common/widgets/anim_pressable.dart';
import 'package:locket_clone/common/widgets/transition_wrapper/transition_helper.dart';
import 'package:locket_clone/presentation/home/camera_screen/camera_screen.dart';
import 'package:locket_clone/presentation/home/friend_screen/friend_screen.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/bloc/newsfeed_cubit.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/newsfeed_screen.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/newsfeed_screen_root.dart';
import 'package:locket_clone/presentation/home/user_info_screen/user_info_screen.dart';

import '../../../core/configs/theme/app_theme.dart';
import '../../../domain/usecases/get_current_user_use_case.dart';
import '../../../presentation/home/bloc/user_cubit.dart';
import '../../../set_up_sl.dart';

class TransitionWrapper extends StatefulWidget {
  const TransitionWrapper({super.key});

  @override
  State<TransitionWrapper> createState() => _TransitionWrapperState();
}

class _TransitionWrapperState extends State<TransitionWrapper> {
  ScrollPhysics get currentScrollPhysics =>
      _locked
          ? const NeverScrollableScrollPhysics()
          : const ClampingScrollPhysics();

  bool _locked = false;
  final commentController = TextEditingController();

  final TransitionHelper _helperIst = TransitionHelper();
  @override
  void initState() {
    super.initState();
    _helperIst.lock = lock;
    _helperIst.unlock = unlock;
  }

  // Singleton
  void lock() {
    setState(() => _locked = true);
  }

  void unlock() {
    setState(() => _locked = false);
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

  void commentHandler() {
    debugPrint('comment: ${commentController.text}');
  }

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) =>
                    UserCubit()..getCurrentUser(sl<GetCurrentUserUseCase>()),
          ),
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
                    // physics: const ClampingScrollPhysics(),
                    physics: currentScrollPhysics,
                    controller: _helperIst.mainController,
                    scrollDirection: Axis.vertical,
                    children: [
                      CameraScreen(),
                      NewsfeedScreenRoot(
                        commentController: commentController,
                        commentHandler: commentHandler,
                        child: NewsfeedScreen()
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
}
