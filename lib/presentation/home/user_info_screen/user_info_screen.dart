import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:locket_clone/domain/entities/user_entity.dart';
import 'package:locket_clone/presentation/data/section_position.dart';
import 'package:locket_clone/presentation/home/user_info_screen/widget/large_circle_avatar.dart';
import 'package:locket_clone/presentation/home/user_info_screen/widget/section_btn.dart';

class UserInfoScreen extends StatelessWidget {
  UserInfoScreen({super.key});
  final width = 148, height = 148;

  final List<SectionBtn> themeSection = [
    SectionBtn(
      svgPath: 'assets/change_theme_ic.svg',
      btnName: 'Change Theme',
      onPressed: () {},
      pos: SectionPosition.ALL,
    ),
  ];

  final List<SectionBtn> generalSection = [
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

  final List<SectionBtn> communitySection = [
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

  // Icon(Icons.arrow_back_ios_new_rounded),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Color(0xffAAC2B3),
                    size: 35,
                  ),
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    LargeCircleAvatar(),
                    Positioned(
                      bottom: 0,
                      right: 10,
                      child: addNewImageBtn(() {}),
                    ),
                  ],
                ),
                SizedBox(height: 18),

                Text(
                  'Hayashing',
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
                  widgets: themeSection,
                ),
                SizedBox(height: 32),
                section(
                  sectionName: 'General',
                  svgPath: 'assets/general_ic.svg',
                  widgets: generalSection,
                ),
                SizedBox(height: 32),
                section(
                  sectionName: 'Community',
                  svgPath: 'assets/community_ic.svg',
                  widgets: communitySection,
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
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
