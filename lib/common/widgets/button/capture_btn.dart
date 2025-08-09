import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:locket_clone/presentation/home/camera_screen/bloc/upload_img_cubit.dart';
import 'package:locket_clone/presentation/data/captured_image_data.dart';

import 'circular_icon_button.dart';

class CaptureBtn extends StatefulWidget {
  const CaptureBtn({super.key, required this.onSendImage});
  final VoidCallback onSendImage;
  @override
  State<CaptureBtn> createState() => _CaptureBtnState();
}

class _CaptureBtnState extends State<CaptureBtn> {
  // 🟩 Extracted Constants
  static const Color _outerCircleColor = Color(0xffAAC2B3);
  static const Color _innerCircleColor = Color(0xffECF4F4);
  static const Color _loadingIndicatorColor = Color(0xff738F81);

  static const String _cameraIconPath = 'assets/camera_ic.svg';
  static const String _sendIconPath = 'assets/send_ic.svg';

  void _onTakePicture() {}

  Widget buildCaptureButton() {
    return GestureDetector(
      onTap: _onTakePicture,
      child: CircularIconButton(
        outerColor: _outerCircleColor,
        innerColor: _innerCircleColor,
        child: SvgPicture.asset(_cameraIconPath, semanticsLabel: 'Camera icon'),
      ),
    );
  }

  Widget buildSendButton() {
    return GestureDetector(
      onTap: widget.onSendImage,
      child: CircularIconButton(
        outerColor: _outerCircleColor,
        innerColor: _innerCircleColor,
        child: SvgPicture.asset(_sendIconPath, semanticsLabel: 'Send icon'),
      ),
    );
  }

  Widget buildLoadingButton() {
    return CircularIconButton(
      outerColor: _outerCircleColor,
      innerColor: _innerCircleColor,
      child: CircularProgressIndicator(color: _loadingIndicatorColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
    //   return BlocBuilder<UploadImgCubit, UploadImgState>(
    //     builder: (context, state) {
    //       switch (state) {
    //         case CaptureState():
    //         case SendImageSuccess():
    //           return buildCaptureButton();
    //         case ReadyToSendState():
    //           return buildSendButton();
    //         case SendImageLoading():
    //           return buildLoadingButton();
    //       }
    //     },
    //   );
    // }
    //
  }
}
