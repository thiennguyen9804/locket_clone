import 'dart:io';
import 'dart:isolate';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
abstract class ImageLocalService {
  Future writeImageToLocal(bool flip, String path);
}


class ImageLocalServiceImpl implements ImageLocalService {
  Future<String> _writeImageToLocal(bool flip, String path, {required String appDir}) async {
    final imageFile = File(path);
    final bytes = await imageFile.readAsBytes();

    img.Image? image = img.decodeImage(bytes);
    if (flip && image != null) {
      image = img.flipHorizontal(image);
    }

    // final appDir = await getApplicationDocumentsDirectory();
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    final newImagePath = '$appDir/$fileName';

    final newFile = File(newImagePath);
    await newFile.writeAsBytes(img.encodeJpg(image!));
    return newImagePath;
  }
  
  @override
  Future<String> writeImageToLocal(bool flip, String path) async {
    // var rootToken = RootIsolateToken.instance!;
    // BackgroundIsolateBinaryMessenger.ensureInitialized(rootToken);
    final appDir = (await getApplicationDocumentsDirectory()).path;

    return await Isolate.run<String>(() async {
      return _writeImageToLocal(flip, path, appDir: appDir);
    });
  }

}