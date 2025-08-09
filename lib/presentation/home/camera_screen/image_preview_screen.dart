import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:locket_clone/presentation/home/camera_screen/bloc/upload_img_cubit.dart';
import 'package:locket_clone/common/screen/base_layout_screen.dart';
import 'package:locket_clone/core/configs/theme/app_theme.dart';
import 'package:locket_clone/presentation/data/captured_image_data.dart';

import '../../../common/widgets/button/circular_icon_button.dart';

@RoutePage()
class ImagePreviewScreen extends BaseLayoutScreen implements AutoRouteWrapper {
  final CapturedImageDataBuilder capturedImageDataBuilder;

  const ImagePreviewScreen(this.capturedImageDataBuilder, {super.key});
  @override
  State<BaseLayoutScreen> createState() => _ImagePreviewScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<UploadImgCubit>(
      create: (_) => UploadImgCubit(),
      child: BlocListener<UploadImgCubit, UploadImgState>(
        listener: (context, state) {
          if (state is SendImageSuccess) {
            context.router.pop();
          }
        },
        child: this,
      ),
    );
  }
}

class _ImagePreviewScreenState extends BaseLayoutScreenState {
  static const Color _outerCircleColor = Color(0xffAAC2B3);
  static const Color _innerCircleColor = Color(0xffECF4F4);
  final controller = TextEditingController();
  @override
  Widget buildFramedContent(BuildContext context) {
    final CapturedImageDataBuilder(:imagePath, :xFlip) =
        (widget as ImagePreviewScreen).capturedImageDataBuilder;
    final file = File(imagePath);
    return Stack(
      fit: StackFit.expand,
      children: [
        Transform.flip(
          flipX: xFlip,
          child: Image.file(file, fit: BoxFit.cover),
        ),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Align(alignment: Alignment.center, child: _captionField()),
        ),
      ],
    );
  }

  Widget _captionField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Color(0xffF2F2F2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 30),
        child: IntrinsicWidth(
          child: TextField(
            controller: controller,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff5F5F5F),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              isCollapsed: true,
              contentPadding: EdgeInsets.zero,
            ),
            cursorColor: Color(0xff5F5F5F),
          ),
        ),
      ),
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

    return BlocBuilder<UploadImgCubit, UploadImgState>(
      builder: (context, state) {
        final Widget child = switch (state) {
          SendImageLoading() => SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              color: AppTheme.mainColor,
            ),
          ),
          _ => SvgPicture.asset(path, semanticsLabel: ''),
        };

        return CircularIconButton(
          outerColor: _outerCircleColor,
          innerColor: _innerCircleColor,
          child: child,
        );
      },
    );
  }

  @override
  void onLeftButtonTap() {
    context.router.pop();
  }

  @override
  void onMainButtonTap() => context.read<UploadImgCubit>().sendImage(
    (widget as ImagePreviewScreen).capturedImageDataBuilder
        .setCaption(controller.text)
        .build(),
  );
}
