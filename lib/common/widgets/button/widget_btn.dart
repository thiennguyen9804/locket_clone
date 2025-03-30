import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:locket_clone/common/widgets/anim_pressable.dart';

class WidgetBtn extends StatefulWidget {
  const WidgetBtn({super.key});

  @override
  State<WidgetBtn> createState() => _WidgetBtnState();
}

class _WidgetBtnState extends State<WidgetBtn> {
  @override
  Widget build(BuildContext context) {
    const path = 'assets/widget_ic.svg';
    final Widget widgetIc = SvgPicture.asset(
      path,
      semanticsLabel: 'Widget',
      width: 28,
      height: 28,
    );

    return AnimPressable(icon: widgetIc, onTap: () {});
  }
}
