import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:locket_clone/common/widgets/anim_pressable.dart';

class CancelBtn extends StatefulWidget {
  const CancelBtn({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  State<CancelBtn> createState() => _CancelBtnState();
}

class _CancelBtnState extends State<CancelBtn> {
  @override
  Widget build(BuildContext context) {
    const changeCamName = 'assets/cancel_ic.svg';
    final Widget changeCamIc = SvgPicture.asset(
      changeCamName,
      semanticsLabel: 'Cancel',
      width: 35,
      height: 35,
    );

    return AnimPressable(icon: changeCamIc, onTap: widget.onTap);
  }
}
