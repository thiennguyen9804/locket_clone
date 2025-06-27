import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  final Color outerColor;
  final Color innerColor;
  final Widget child;

  const CircularIconButton({
    super.key,
    required this.outerColor,
    required this.innerColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 105,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        color: outerColor,
      ),
      padding: const EdgeInsets.all(11),
      child: Container(
        width: 83,
        height: 83,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          color: innerColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 23),
        child: child,
      ),
    );
  }
}
