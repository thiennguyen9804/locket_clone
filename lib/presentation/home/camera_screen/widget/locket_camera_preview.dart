import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:locket_clone/core/extension/context_extensions.dart';

class LegacyLocketCameraPreview extends StatelessWidget {
  final CameraController controller;

  const LegacyLocketCameraPreview({super.key, required this.controller});

  bool get isFrontCam => true;

  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth;
    return Container(
      width: context.screenWidth,
      height: context.screenWidth,
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
                height: width * controller.value.aspectRatio,
                child: Transform.flip(
                  flipX: isFrontCam,
                  child: CameraPreview(controller),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
