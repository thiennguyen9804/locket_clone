import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:locket_clone/common/widgets/anim_pressable.dart';

class ChangeCamButton extends StatefulWidget {
  const ChangeCamButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  State<ChangeCamButton> createState() => _ChangeCamButtonState();
}

class _ChangeCamButtonState extends State<ChangeCamButton> {
  @override
  Widget build(BuildContext context) {
    const changeCamName = 'assets/change_camera_ic.svg';
    final Widget changeCamIc = SvgPicture.asset(
      changeCamName,
      semanticsLabel: 'Flash on',
      width: 38,
      height: 38,
    );

    return AnimPressable(icon: changeCamIc, onTap: widget.onTap);
  }
}
