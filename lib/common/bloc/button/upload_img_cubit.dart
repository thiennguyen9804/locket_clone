import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locket_clone/data/source/post_api_service.dart';
import 'package:locket_clone/domain/repository/post_repository.dart';
import 'package:locket_clone/domain/repository/user_repository.dart';
import 'package:locket_clone/presentation/data/upload_post.dart';
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

  Future sendImageHandler(UploadPost post) async {
    await Future.delayed(const Duration(seconds: 2));
    await sl<PostRepository>().addPost(post);
  }

  void onCapture() {
    emit(SendImageState());
    takePicture();
  }

  void onCancel() {
    emit(CaptureState());
  }

  Future onSendImage(UploadPost post) async {
    emit(SendImageLoading());
    await sendImageHandler(post);
    emit(SendImageSuccess());
  }
}
