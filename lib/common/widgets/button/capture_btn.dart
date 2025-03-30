import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CaptureBtn extends StatefulWidget {
  const CaptureBtn({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  State<CaptureBtn> createState() => _CaptureBtnState();
}

class _CaptureBtnState extends State<CaptureBtn> {
  bool isTap = false;

  @override
  Widget build(BuildContext context) {
    const captureBtnNotClickName = 'assets/capture_btn_not_click_ic.svg';
    const captureBtnClickName = 'assets/capture_btn_click_ic.svg';
    final Widget captureBtnIc = SvgPicture.asset(
      captureBtnNotClickName,
      semanticsLabel: 'Not click',
    );

    final Widget captureBtnOnClickIc = SvgPicture.asset(
      captureBtnClickName,
      semanticsLabel: 'On click',
    );

    final icon = isTap ? captureBtnOnClickIc : captureBtnIc;

    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (details) {
        setState(() {
          isTap = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          isTap = false;
        });
      },
      child: icon,
    );
  }
}
