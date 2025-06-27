import 'package:flutter/src/widgets/framework.dart';
import 'package:locket_clone/common/screen/base_layout_screen.dart';
import 'package:locket_clone/presentation/data/captured_image_data.dart';

class ImagePreviewScreen extends BaseLayoutScreen {
  final CapturedImageDataBuilder capturedImageDataBuilder;

  const ImagePreviewScreen(this.capturedImageDataBuilder, {super.key});
  @override
  State<BaseLayoutScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends BaseLayoutScreenState {
  @override
  Widget buildFramedContent(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget leftButton() {
    // TODO: implement leftButton
    throw UnimplementedError();
  }

  @override
  Widget mainButton() {
    // TODO: implement mainButton
    throw UnimplementedError();
  }

  @override
  Widget? rightButton() {
    // TODO: implement rightButton
    throw UnimplementedError();
  }

  @override
  void onLeftButtonTap() {
    // TODO: implement onLeftButtonTap
  }

  @override
  void onMainButtonTap() {
    // TODO: implement onMainButtonTap
  }
}
