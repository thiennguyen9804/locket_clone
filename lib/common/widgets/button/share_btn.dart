import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:locket_clone/common/widgets/anim_pressable.dart';

class ShareBtn extends StatefulWidget {
  const ShareBtn({super.key});

  @override
  State<ShareBtn> createState() => _ShareBtnState();
}

class _ShareBtnState extends State<ShareBtn> {
  @override
  Widget build(BuildContext context) {
    const path = 'assets/share_ic.svg';
    final Widget widgetIc = SvgPicture.asset(
      path,
      semanticsLabel: 'Widget',
      width: 28,
      height: 28,
    );

    return AnimPressable(icon: widgetIc, onTap: () {});
  }
}
