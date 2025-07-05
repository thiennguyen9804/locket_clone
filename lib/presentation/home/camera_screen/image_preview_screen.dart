import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:locket_clone/common/screen/base_layout_screen.dart';
import 'package:locket_clone/common/widgets/button/send_btn.dart';
import 'package:locket_clone/presentation/data/captured_image_data.dart';

class ImagePreviewScreenRoot extends StatelessWidget {
  const ImagePreviewScreenRoot(this.capturedImageDataBuilder, {super.key});

  final CapturedImageDataBuilder capturedImageDataBuilder;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _ImagePreviewScreen(capturedImageDataBuilder));
  }
}

class _ImagePreviewScreen extends BaseLayoutScreen {
  final CapturedImageDataBuilder capturedImageDataBuilder;

  const _ImagePreviewScreen(this.capturedImageDataBuilder, {super.key});
  @override
  State<BaseLayoutScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends BaseLayoutScreenState {
  @override
  Widget buildFramedContent(BuildContext context) {
    final file = File(
      (widget as _ImagePreviewScreen).capturedImageDataBuilder.imagePath!,
    );
    return Image.file(file, fit: BoxFit.contain);
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
  void onLeftButtonTap() {}

  @override
  void onMainButtonTap() {
    // TODO: implement onMainButtonTap
  }
}
