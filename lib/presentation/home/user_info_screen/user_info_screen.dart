import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:locket_clone/domain/entities/user_entity.dart';
import 'package:locket_clone/domain/repository/auth_repository.dart';
import 'package:locket_clone/presentation/data/section_position.dart';
import 'package:locket_clone/presentation/home/bloc/user_cubit.dart';
import 'package:locket_clone/presentation/home/user_info_screen/widget/large_circle_avatar.dart';
import 'package:locket_clone/presentation/home/user_info_screen/widget/section_btn.dart';
import 'package:locket_clone/presentation/router/app_router.gr.dart';
import 'package:locket_clone/set_up_sl.dart';

@RoutePage()
class UserInfoScreen extends StatelessWidget implements AutoRouteWrapper {
  const UserInfoScreen({super.key});
  final width = 148, height = 148;

  List<SectionBtn> themeSection(BuildContext context) => [
    SectionBtn(
      svgPath: 'assets/change_theme_ic.svg',
      btnName: 'Change Theme',
      onPressed: () {},
      pos: SectionPosition.ALL,
    ),
  ];

  List<SectionBtn> generalSection(BuildContext context) => [
    SectionBtn(
      svgPath: 'assets/change_phone_ic.svg',
      btnName: 'Change phone number',
      onPressed: () {},
      pos: SectionPosition.TOP,
    ),
    SectionBtn(
      svgPath: 'assets/change_email_address_ic.svg',
      btnName: 'Change email address',
      onPressed: () {},
      pos: SectionPosition.MID,
    ),
    SectionBtn(
      svgPath: 'assets/change_password_ic.svg',
      btnName: 'Change password',
      onPressed: () {},
      pos: SectionPosition.MID,
    ),
    SectionBtn(
      svgPath: 'assets/share_feedback_ic.svg',
      btnName: 'Share feedback',
      onPressed: () {},
      pos: SectionPosition.MID,
    ),
    SectionBtn(
      svgPath: 'assets/report_problem_ic.svg',
      btnName: 'Report a problem',
      onPressed: () {},
      pos: SectionPosition.BOT,
    ),
  ];

  List<SectionBtn> communitySection(BuildContext context) => [
    SectionBtn(
      btnName: 'Share OurZone',
      svgPath: 'assets/white_share_ic.svg',
      onPressed: () {},
      pos: SectionPosition.TOP,
    ),
    SectionBtn(
      btnName: 'Friends',
      svgPath: 'assets/friends_ic.svg',
      onPressed: () {},
      pos: SectionPosition.MID,
    ),
    SectionBtn(
      btnName: 'Rate OurZone',
      svgPath: 'assets/rate_ic.svg',
      onPressed: () {},
      pos: SectionPosition.MID,
    ),
    SectionBtn(
      btnName: 'Terms of Service',
      svgPath: 'assets/tos_ic.svg',
      onPressed: () {},
      pos: SectionPosition.MID,
    ),
    SectionBtn(
      btnName: 'Privacy Policy',
      svgPath: 'assets/pp_ic.svg',
      onPressed: () {},
      pos: SectionPosition.BOT,
    ),
  ];

  List<SectionBtn> manageSection(BuildContext context) => [
    SectionBtn(
      svgPath: 'assets/sign_out_ic.svg',
      btnName: 'Log out',
      onPressed: () {
        sl<AuthRepository>().logout();
        context.router.replaceAll([SignInRoute()]);
      },
      pos: SectionPosition.TOP,
    ),
    SectionBtn(
      svgPath: 'assets/delete_ic.svg',
      btnName: 'Delete account',
      onPressed: () {},
      pos: SectionPosition.BOT,
    ),
  ];

  Widget addNewImageBtn(VoidCallback onPressed) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 3),
        shape: BoxShape.circle,
        color: Color(0xffAAC2B3),
      ),
      child: Icon(Icons.add, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: context.router.pop,
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Color(0xffAAC2B3),
                        size: 35,
                      ),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      LargeCircleAvatar(
                        state is UserLoadedSuccess
                            ? state.userEntity.avatarUrl ?? ""
                            : "",
                      ),
                      Positioned(
                        bottom: 0,
                        right: 10,
                        child: addNewImageBtn(() {}),
                      ),
                    ],
                  ),
                  SizedBox(height: 18),
                  Text(
                    state is UserLoadedSuccess ? state.userEntity.name : '',
                    style: TextStyle(
                      letterSpacing: 1.07,
                      color: Color(0xff6B9080),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        BoxShadow(
                          blurRadius: 2,
                          offset: Offset(0, 1),
                          color: Color.fromARGB(64, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Edit info',
                      style: TextStyle(letterSpacing: 1.07),
                    ),
                  ),
                  SizedBox(height: 32),
                  section(
                    svgPath: 'assets/theme_section_ic.svg',
                    sectionName: 'Theme',
                    widgets: themeSection(context),
                  ),
                  SizedBox(height: 32),
                  section(
                    sectionName: 'General',
                    svgPath: 'assets/general_ic.svg',
                    widgets: generalSection(context),
                  ),
                  SizedBox(height: 32),
                  section(
                    sectionName: 'Community',
                    svgPath: 'assets/community_ic.svg',
                    widgets: communitySection(context),
                  ),
                  SizedBox(height: 32),
                  section(
                    sectionName: 'Manage',
                    svgPath: 'assets/manage_ic.svg',
                    widgets: manageSection(context),
                  ),
                  SizedBox(height: 32),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..getCurrentUser(),
      child: this,
    );
  }

  Widget section({
    required String svgPath,
    required String sectionName,
    required List<SectionBtn> widgets,
  }) {
    final svg = SvgPicture.asset(svgPath);
    return Column(
      children: [
        Row(
          children: [
            svg,
            SizedBox(width: 8),
            Text(
              sectionName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Color(0xff6B9080),
              ),
            ),
          ],
        ),
        for (SectionBtn widget in widgets) widget,
      ],
    );
  }
}
