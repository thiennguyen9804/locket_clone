import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:locket_clone/common/widgets/anim_pressable.dart';

class FlashBtn extends StatefulWidget {
  const FlashBtn({super.key});

  @override
  State<FlashBtn> createState() => _FlashBtnState();
}

class _FlashBtnState extends State<FlashBtn> {
  bool flashOff = true;

  @override
  Widget build(BuildContext context) {
    const flashOffName = 'assets/flash_off_ic.svg';
    const flashOnName = 'assets/flash_on_ic.svg';
    final Widget flashOffIc = SvgPicture.asset(
      flashOffName,
      semanticsLabel: 'Flash off',
    );

    final Widget flashOnIc = SvgPicture.asset(
      flashOnName,
      semanticsLabel: 'Flash on',
      width: 38,
      height: 38,
    );
    final icon = flashOff ? flashOffIc : flashOnIc;

    return AnimPressable(icon: icon, onTap: () {
      setState(() {
        flashOff = !flashOff;
      });
    });
  }
}
