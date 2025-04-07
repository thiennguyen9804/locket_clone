import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'upload_img_state.dart';

class UploadImgCubit extends Cubit<UploadImgState> {
  UploadImgCubit({required this.takePicture, required this.cancelHandler})
    : super(CaptureState());
  final VoidCallback takePicture;
  final VoidCallback cancelHandler;

  void onCapture() {
    emit(SendImageState());
    takePicture();
  }

  void onCancel() {
    emit(CaptureState());
    cancelHandler();
  }

  void onSendImage() {
    
  }
}
