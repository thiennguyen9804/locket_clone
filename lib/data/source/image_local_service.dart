import 'dart:io';
import 'package:image/image.dart' as img;
abstract class ImageLocalService {
  Future writeImageToLocal(bool flip, String path);
}


class ImageLocalServiceImpl implements ImageLocalService {
  @override
  Future writeImageToLocal(bool flip, String path) async {
    if (flip) {
      final imageFile = File(path);

      final bytes = await imageFile.readAsBytes();
      img.Image? image = img.decodeImage(bytes);

      image = img.flipHorizontal(image!);
      await imageFile.writeAsBytes(img.encodeJpg(image));
    }
  }

}