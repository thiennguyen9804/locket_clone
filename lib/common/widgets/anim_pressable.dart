import 'package:flutter/material.dart';

class AnimPressable extends StatefulWidget {
  const AnimPressable({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final Widget icon;
  final VoidCallback onTap;

  @override
  State<AnimPressable> createState() => _AnimPressableState();
}

class _AnimPressableState extends State<AnimPressable> {
  double target = 1;
  int duration = 100;
  @override
  Widget build(BuildContext context) {

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 1, end: target),
      duration: Duration(milliseconds: duration),
      builder: (BuildContext context, double value, Widget? child) {
        return Transform.scale(
          scale: value,
          child: GestureDetector(
            onTap: () {
              setState(() {
                setState(() {
                  target = 0.8; // Thu nhỏ
                });

                Future.delayed(Duration(milliseconds: duration), () {
                  widget.onTap();
                  setState(() {
                    target = 1.0; // Phóng to lại
                  });
                });
              });
            },
            child: widget.icon,
          ),
        );
      },
    );
  }
}
