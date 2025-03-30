import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SendBtn extends StatefulWidget {
  const SendBtn({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  State<SendBtn> createState() => _SendBtnState();
}

class _SendBtnState extends State<SendBtn> {
  @override
  Widget build(BuildContext context) {
    const path = 'assets/send_ic.svg';
    final Widget sendBtnIc = SvgPicture.asset(
      path,
      semanticsLabel: 'Send Picture',
    );

    final icon = sendBtnIc;

    return icon;
  }
}
