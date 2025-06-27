import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:locket_clone/domain/repository/post_repository.dart';
import 'package:locket_clone/presentation/data/captured_image_data.dart';
import 'package:locket_clone/set_up_sl.dart';
import 'package:meta/meta.dart';

part 'upload_img_state.dart';

class UploadImgCubit extends Cubit<UploadImgState> {
  UploadImgCubit({required this.takePicture, required this.onSendImageSuccess})
    : super(CaptureState()) {
    // emit(SendImageLoading());
  }
  final VoidCallback takePicture;
  final VoidCallback onSendImageSuccess;

  Future sendImageHandler(CapturedImageData post) async {
    // await Future.delayed(const Duration(seconds: 2));
    await sl<PostRepository>().addPost(post);
  }

  void onCapture() {
    emit(ReadyToSendState());
    takePicture();
  }

  void onCancel() {
    emit(CaptureState());
  }

  Future onSendImage(CapturedImageData post) async {
    emit(SendImageLoading());
    await sendImageHandler(post);
    emit(SendImageSuccess());
  }
}
