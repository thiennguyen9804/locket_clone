import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../../data/captured_image_data.dart';

class ImageStateManager {
  XFile? imageFile;
  TextEditingController? captionController;

  bool get hasImage => imageFile != null;

  Future<void> deleteImage() async {
    if (imageFile == null) return;
    final file = File(imageFile!.path);
    if (await file.exists()) {
      await file.delete();
    }
    imageFile = null;
  }

  void reset() {
    imageFile = null;
    captionController?.clear();
  }

  CapturedImageData getSnapshot(bool isFrontCamera) {
    return CapturedImageData(
      imagePath: imageFile!.path,
      caption: captionController!.text,
      xFlip: isFrontCamera,
    );
  }

  void dispose() {
    captionController?.dispose();
  }
}
