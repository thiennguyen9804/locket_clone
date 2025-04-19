import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:locket_clone/common/bloc/button/upload_img_cubit.dart';
import 'package:locket_clone/presentation/data/upload_post.dart';

class CaptureBtn extends StatefulWidget {
  const CaptureBtn({super.key, required this.onSendImage,});
  final VoidCallback onSendImage;
  @override
  State<CaptureBtn> createState() => _CaptureBtnState();
}

class _CaptureBtnState extends State<CaptureBtn> {
  bool isTap = false;

  Widget _btnLayout({
    required Color outColor,
    required Color inColor,
    required Widget child,
  }) {
    return Container(
      width: 105,
      height: 105,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        color: outColor,
      ),
      padding: EdgeInsets.all(11),
      child: Container(
        width: 83,
        height: 83,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          color: inColor,
        ),
        padding: EdgeInsets.symmetric(horizontal: 23, vertical: 23),
        child: child,
      ),
    );
  }

  void _onTakePicture() {
    context.read<UploadImgCubit>().onCapture();
    // widget.takePicture();
  }

  

  Widget capBtn() {
    const captureBtnNotClickName = 'assets/camera_ic.svg';
    final Widget captureBtnIc = SvgPicture.asset(
      captureBtnNotClickName,
      semanticsLabel: 'Not click',
    );
    return GestureDetector(
      onTap: _onTakePicture,
      child: _btnLayout(
        outColor: Color(0xffAAC2B3),
        inColor: Color(0xffECF4F4),
        child: captureBtnIc,
      ),
    );
  }

  Widget sendBtn() {
    const sendIcPath = 'assets/send_ic.svg';
    final Widget sendIc = SvgPicture.asset(
      sendIcPath,
      semanticsLabel: 'Send icon',
    );
    return GestureDetector(
      onTap: widget.onSendImage,
      child: _btnLayout(
        outColor: Color(0xffAAC2B3),
        inColor: Color(0xffECF4F4),
        child: sendIc,
      ),
    );
  }



  Widget loadingBtn() {
    return _btnLayout(
      outColor: Color(0xffAAC2B3),
      inColor: Color(0xffECF4F4),
      child: CircularProgressIndicator(color: Color(0xff738F81)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadImgCubit, UploadImgState>(
      builder: (context, state) {
        switch (state) {
          case CaptureState():
            return capBtn();
          case SendImageState():
            return sendBtn();
          case SendImageLoading():
            return loadingBtn();
          case SendImageSuccess():
            return capBtn();
        }
      },
    );
  }
}
