import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:locket_clone/common/screen/base_layout_screen.dart';
import 'package:locket_clone/common/widgets/button/capture_btn.dart';
import 'package:locket_clone/common/widgets/button/change_cam_btn.dart';
import 'package:locket_clone/common/widgets/button/circular_icon_button.dart';
import 'package:locket_clone/core/extension/context_extensions.dart';
import 'package:locket_clone/presentation/home/camera_screen/image_preview_screen.dart';
import 'package:locket_clone/presentation/home/camera_screen/widget/locket_camera_preview.dart';
import 'package:locket_clone/set_up_sl.dart';

import '../../../core/configs/theme/app_theme.dart';
import '../../data/captured_image_data.dart';

class CameraScreen extends BaseLayoutScreen {
  const CameraScreen({super.key});

  @override
  State<BaseLayoutScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends BaseLayoutScreenState {
  static const Color _outerCircleColor = Color(0xffAAC2B3);
  static const Color _innerCircleColor = Color(0xffECF4F4);
  static const Color _loadingIndicatorColor = Color(0xff738F81);

  static const String _cameraIconPath = 'assets/camera_ic.svg';
  static const String _sendIconPath = 'assets/send_ic.svg';

  late CameraController _cameraController;
  Future<void>? _initializeControllerFuture;
  List<CameraDescription> _cameras = [];
  int _selectedCameraIndex = 0;
  bool _isUsingFrontCamera() =>
      _cameras[_selectedCameraIndex].lensDirection == CameraLensDirection.front;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    _selectedCameraIndex = 0;
    await _initializeCamera(_cameras[_selectedCameraIndex]);
  }

  Future<void> _initializeCamera(CameraDescription cameraDescription) async {
    _cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.max,
    );

    _initializeControllerFuture = _cameraController.initialize();
    setState(() {});
  }

  @override
  Widget buildFramedContent(BuildContext context) {
    if (_initializeControllerFuture == null) {
      return Center(
        child: CircularProgressIndicator(color: AppTheme.mainColor),
      );
    }

    return FutureBuilder(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          super.frameHeight =
              context.screenWidth * _cameraController.value.aspectRatio;
          return CameraPreview(_cameraController);
        }

        return Center(
          child: CircularProgressIndicator(color: AppTheme.mainColor),
        );
      },
    );
  }

  @override
  Widget rightButton() {
    const changeCamName = 'assets/change_camera_ic.svg';
    final Widget changeCamIc = SvgPicture.asset(
      changeCamName,
      semanticsLabel: 'Flash on',
      width: 38,
      height: 38,
    );
    return changeCamIc;
  }

  @override
  Widget mainButton() {
    return CircularIconButton(
      outerColor: _outerCircleColor,
      innerColor: _innerCircleColor,
      child: SvgPicture.asset(_cameraIconPath, semanticsLabel: ''),
    );
  }

  @override
  Widget leftButton() {
    const flashOffName = 'assets/flash_off_ic.svg';
    const flashOnName = 'assets/flash_on_ic.svg';
    final Widget flashOffIc = SvgPicture.asset(
      flashOffName,
      semanticsLabel: 'Flash off',
    );

    final Widget flashOnIc = SvgPicture.asset(
      flashOnName,
      semanticsLabel: 'Flash on',
      width: 38,
      height: 38,
    );
    final icon =
        _cameraController.value.flashMode == FlashMode.torch
            ? flashOnIc
            : flashOffIc;

    return icon;
  }

  @override
  void onRightButtonTap() async {
    _selectedCameraIndex = (_selectedCameraIndex + 1) % _cameras.length;
    await _cameraController.dispose();
    await _initializeCamera(_cameras[_selectedCameraIndex]);
  }

  @override
  void onMainButtonTap() async {
    debugPrint('📸 takePicture called');
    final navigator = Navigator.of(context);
    final file = await _cameraController.takePicture();
    final xFlip = _isUsingFrontCamera();
    final capturedImageDataBuilder = CapturedImageDataBuilder();
    capturedImageDataBuilder.setImagePath(file.path).setXFlip(xFlip);

    navigator.push(
      MaterialPageRoute(
        builder: (context) => ImagePreviewScreenRoot(capturedImageDataBuilder),
      ),
    );
  }

  @override
  void onLeftButtonTap() async {
    final current = _cameraController.value.flashMode;
    final next = current == FlashMode.off ? FlashMode.torch : FlashMode.off;
    await _cameraController.setFlashMode(next);
    setState(() {});
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }
}
