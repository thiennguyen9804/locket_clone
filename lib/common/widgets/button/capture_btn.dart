import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:locket_clone/common/bloc/button/upload_img_cubit.dart';

class CaptureBtn extends StatefulWidget {
  const CaptureBtn({
    super.key,
    required this.takePicture,
    required this.sendImg,
  });
  final VoidCallback takePicture;
  final VoidCallback sendImg;
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
        padding: EdgeInsets.symmetric(horizontal: 23, vertical: 20),
        child: child,
      ),
    );
  }

  Widget capBtn() {
    const captureBtnNotClickName = 'assets/camera_ic.svg';
    final Widget captureBtnIc = SvgPicture.asset(
      captureBtnNotClickName,
      semanticsLabel: 'Not click',
    );
    return _btnLayout(
      outColor: Color(0xffAAC2B3),
      inColor: Color(0xffECF4F4),
      child: captureBtnIc,
    );
  }

  Widget capBtnClicked() {
    const captureBtnClickName = 'assets/camera_ic_click.svg';

    final Widget captureBtnOnClickIc = SvgPicture.asset(
      captureBtnClickName,
      semanticsLabel: 'On click',
    );

    return _btnLayout(
      outColor: Color(0xffAAC2B3),
      inColor: Color(0xff738F81),
      child: captureBtnOnClickIc,
    );
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider<UploadImgCubit>(
      create:
          (context) => UploadImgCubit(
            takePicture: widget.takePicture,
            cancelHandler: widget.sendImg,
          ),
      child: GestureDetector(
        onTap: widget.takePicture,
        onTapDown: (details) {
          setState(() {
            isTap = true;
          });
        },
        onTapUp: (details) {
          setState(() {
            isTap = false;
          });
        },
        child: BlocBuilder<UploadImgCubit, UploadImgState>(builder: (context, state) {
          switch(state) {
             
            case CaptureState():
              return capBtn();
            case SendImageState():
              // TODO: Handle this case.
              throw UnimplementedError();
            case SendImageLoading():
              // TODO: Handle this case.
              throw UnimplementedError();
            case SendImageSuccess():
              // TODO: Handle this case.
              throw UnimplementedError();
          }
        }),
      ),
    );
  }
}
