import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';

class LocketFramedBox extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;

  const LocketFramedBox({
    required this.width,
    required this.height,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xffBBBBBB),
        border: Border.all(color: const Color(0xffD0E2DE), width: 4),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(115, 143, 129, 0.8),
              offset: const Offset(0, 4),
              blurRadius: 4,
            ),
          ],
          borderRadius: BorderRadius.circular(40),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: OverflowBox(
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: SizedBox(
                width: width,
                height: height,
                child: InnerShadow(
                  shadows: [
                    BoxShadow(
                      color: const Color.fromRGBO(236, 244, 244, 0.56),
                      offset: const Offset(0, 6),
                      blurRadius: 8,
                    ),
                  ],
                  child: SizedBox(width: width, height: height, child: child),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
