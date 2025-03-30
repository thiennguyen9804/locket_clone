import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indexed/indexed.dart';
import 'package:locket_clone/common/widgets/anim_pressable.dart';
import 'package:locket_clone/common/widgets/transition_wrapper/transition_helper.dart';
import 'package:locket_clone/presentation/home/camera_screen/camera_screen.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/bloc/newsfeed_cubit.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/bloc/newsfeed_state.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/newsfeed_screen.dart';

import '../../../core/configs/theme/app_theme.dart';
import '../../../domain/usecases/get_current_user_use_case.dart';
import '../../../presentation/home/bloc/user_cubit.dart';
import '../../../set_up_sl.dart';

class TransitionWrapper extends StatelessWidget {
  TransitionWrapper({super.key});

  final TransitionHelper _helperIst = TransitionHelper(); // Singleton

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
        child: imageUrl != null
            ? CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              )
            : Icon(Icons.account_circle_outlined, color: Colors.white),
      ),
    );
  }

  Widget _avatarBtn(VoidCallback onPress) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      return switch (state) {
        UserLoading() || UserLoadedFail() => Container(
            decoration: BoxDecoration(
              color: AppTheme.mainColor,
              borderRadius: BorderRadius.circular(100),
            ),
            width: 38,
            height: 38,
            padding: EdgeInsets.all(5),
            child: Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
            ),
          ),
        UserLoadedSuccess() => _avatar(() {}, state.userEntity.avatarUrl),
      };
    });
  }

  Widget _friendBtn(VoidCallback onPress) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(elevation: 3),
      child: Row(
        children: [
          Icon(
            Icons.people,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            'Friends',
            style: TextStyle().copyWith(),
          ),
        ],
      ),
    );
  }

  Widget _chatBtn(VoidCallback onPress) {
    return IconButton(
      onPressed: onPress,
      color: Colors.white,
      icon: Icon(
        Icons.chat,
        size: 20,
      ),
      style: IconButton.styleFrom(backgroundColor: AppTheme.mainColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                UserCubit()..getCurrentUser(sl<GetCurrentUserUseCase>()),
          ),
          BlocProvider(
            create: (context) => NewsfeedCubit()..loadPosts(),
          ),
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
                    padding:
                        const EdgeInsets.only(left: 38.0, right: 38.0, top: 10),
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
                      stops: [
                        0.0,
                        0.44,
                        1.0,
                      ],
                      radius: 1,
                    ),
                  ),
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _helperIst.mainController,
                    scrollDirection: Axis.vertical,
                    children: [
                      CameraScreen(),
                      NewsfeedScreen(),
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
}

class ContentScreen extends StatelessWidget {
  final String title;
  final Color color;

  const ContentScreen({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          "Màn hình $title",
          style: const TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
