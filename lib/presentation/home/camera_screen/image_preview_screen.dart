import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:locket_clone/common/screen/base_layout_screen.dart';
import 'package:locket_clone/presentation/data/captured_image_data.dart';

@RoutePage()
class ImagePreviewScreen extends BaseLayoutScreen {
  final CapturedImageDataBuilder capturedImageDataBuilder;

  const ImagePreviewScreen(this.capturedImageDataBuilder, {super.key});
  @override
  State<BaseLayoutScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends BaseLayoutScreenState {
  @override
  Widget buildFramedContent(BuildContext context) {
    final CapturedImageDataBuilder(:imagePath, :xFlip) =
        (widget as ImagePreviewScreen).capturedImageDataBuilder;
    final file = File(imagePath);
    return Transform.flip(
      flipX: xFlip,
      child: Image.file(file, fit: BoxFit.cover),
    );
  }

  @override
  Widget leftButton() {
    const cancelName = 'assets/cancel_ic.svg';
    final Widget cancelIc = SvgPicture.asset(
      cancelName,
      semanticsLabel: 'Cancel',
      width: 35,
      height: 35,
    );
    return cancelIc;
  }

  @override
  Widget mainButton() {
    const path = 'assets/send_ic.svg';
    final Widget sendBtnIc = SvgPicture.asset(
      path,
      semanticsLabel: 'Send Picture',
    );

    final icon = sendBtnIc;

    return icon;
  }

  @override
  void onLeftButtonTap() {
    context.router.pop();
  }

  @override
  void onMainButtonTap() {
    // TODO: implement onMainButtonTap
  }
}
