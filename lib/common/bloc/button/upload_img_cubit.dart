import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:locket_clone/domain/repository/post_repository.dart';
import 'package:locket_clone/presentation/data/captured_image_data.dart';
import 'package:locket_clone/set_up_sl.dart';
import 'package:meta/meta.dart';

part 'upload_img_state.dart';

class UploadImgCubit extends Cubit<UploadImgState> {
  UploadImgCubit() : super(CaptureState()) {
    // emit(SendImageLoading());
  }

  void sendImage(CapturedImageData post) async {
    await sl<PostRepository>().addPost(post);
  }
}
