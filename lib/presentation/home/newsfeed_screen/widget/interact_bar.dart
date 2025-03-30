import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InteractBar extends StatelessWidget {
  InteractBar({super.key});
  final Widget loveIc = SvgPicture.asset(
    'assets/love_ic.svg',
    width: 20,
    height: 20,
  );
  final Widget sadIc = SvgPicture.asset(
    'assets/sad_ic.svg',
    width: 20,
    height: 20,
  );
  final Widget fireIc = SvgPicture.asset(
    'assets/fire_ic.svg',
    width: 20,
    height: 20,
  );
  final Widget moreIc = SvgPicture.asset(
    'assets/more_ic.svg',
    width: 20,
    height: 20,
  );

  Widget commentBar() {
    return Text(
      'Send message',
      style: TextStyle(
        fontSize: 14,
        letterSpacing: 1.05,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget emojiBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        loveIc,
        sadIc,
        fireIc,
        moreIc,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      decoration: BoxDecoration(
        color: Color(0xffAAC2B3),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Color(0x8c738F81),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 4,
            color: Color(0x92738F81),
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 7,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            commentBar(),
            SizedBox(width: 16),
            Expanded(child: emojiBar()),
          ],
        ),
      ),
    );
  }
}
