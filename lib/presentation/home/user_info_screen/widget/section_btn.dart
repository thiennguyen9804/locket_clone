import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:locket_clone/presentation/data/section_position.dart';

class SectionBtn extends StatelessWidget {
  const SectionBtn({
    super.key,
    required this.svgPath,
    required this.btnName,
    required this.onPressed,
    required this.pos,
  });
  final String svgPath;
  final String btnName;
  final VoidCallback onPressed;
  final SectionPosition pos;

  @override
  Widget build(BuildContext context) {
    final svg = SvgPicture.asset(svgPath);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4,),
        backgroundColor: Color(0xffAAC2B3),
        shape: switch (pos) {
          SectionPosition.TOP => RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(13),
              topRight: Radius.circular(13),
            ),
          ),
          SectionPosition.ALL => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          SectionPosition.BOT => RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(13),
              bottomRight: Radius.circular(13),
            ),
          ),
          // TODO: Handle this case.
          SectionPosition.MID => RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
          ),
        },
      ),
      child: Row(
        children: [
          svg,
          SizedBox(width: 10),
          Text(btnName),
          Spacer(),
          Icon(Icons.keyboard_arrow_right_rounded, size: 35),
        ],
      ),
    );
  }
}
