import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:locket_clone/core/extension/context_extensions.dart';
import 'package:locket_clone/presentation/home/camera_screen/widget/locket_frame_box.dart';

abstract class BaseLayoutScreen extends StatefulWidget {
  const BaseLayoutScreen({super.key});

  @override
  State<BaseLayoutScreen> createState();
}

abstract class BaseLayoutScreenState extends State<BaseLayoutScreen> {
  double? frameHeight;

  @nonVirtual
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 132),
      child: SizedBox(
        height: context.screenHeight,
        child: Column(
          children: [
            LocketFramedBox(
              height: frameHeight ?? context.screenWidth,
              width: context.screenWidth,
              child: buildFramedContent(context),
            ),
            const Spacer(),
            buildControlBar(),

            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  /// Reusable control bar builder
  @nonVirtual
  @protected
  Widget buildControlBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildButton(leftButton(), onLeftButtonTap),
          const Spacer(),
          buildButton(mainButton(), onMainButtonTap),
          const Spacer(),
          buildButton(rightButton(), onRightButtonTap),
        ],
      ),
    );
  }

  /// Helper to wrap button with tap handler
  Widget buildButton(Widget? button, VoidCallback? onTap) {
    if (button == null) return const SizedBox.shrink();
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: button,
    );
  }

  /// Subclass must provide
  @protected
  Widget buildFramedContent(BuildContext context);

  @protected
  Widget leftButton();

  @protected
  Widget mainButton();

  @protected
  Widget? rightButton() {
    return null;
  }

  /// Optional overrides for tap logic
  @protected
  void onLeftButtonTap();

  @protected
  void onMainButtonTap();

  @protected
  void onRightButtonTap() {}
}
