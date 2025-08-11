import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:locket_clone/common/screen/base_layout_screen.dart';
import 'package:locket_clone/common/widgets/button/circular_icon_button.dart';
import 'package:locket_clone/common/screen/transition_wrapper/transition_helper.dart';
import 'package:locket_clone/core/extension/context_extensions.dart';
import 'package:locket_clone/presentation/router/app_router.gr.dart';

import '../../../core/configs/theme/app_theme.dart';
import '../../data/captured_image_data.dart';

@RoutePage()
class CameraScreen extends BaseLayoutScreen {
  const CameraScreen({super.key});

  @override
  State<BaseLayoutScreen> createState() => CameraScreenState();
}

class CameraScreenState extends BaseLayoutScreenState with AutoRouteAware {
  static const Color _outerCircleColor = Color(0xffAAC2B3);
  static const Color _innerCircleColor = Color(0xffECF4F4);

  static const String _cameraIconPath = 'assets/camera_ic.svg';

  late CameraController _cameraController;
  final _helperInstant = TransitionHelper();
  AutoRouteObserver? _observer;
  Future<void>? _initializeControllerFuture;
  List<CameraDescription> _cameras = [];
  int _selectedCameraIndex = 0;
  bool _isUsingFrontCamera() =>
      _cameras[_selectedCameraIndex].lensDirection == CameraLensDirection.front;

  void cameraHandler(int page) {
    if (page == 0) {
      _cameraController.resumePreview(); // Hoặc startCamera()
    } else {
      _cameraController.pausePreview(); // Hoặc stopCamera()
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // RouterScope exposes the list of provided observers
    // including inherited observers
    _observer =
        RouterScope.of(context).firstObserverOfType<AutoRouteObserver>();
    _observer?.subscribe(this, context.routeData);
  }

  @override
  void didPush() {
    _cameraController.resumePreview();
  }

  // Khi quay lại từ route khác
  @override
  void didPop() {
    _cameraController.pausePreview();
  }

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
    try {
      debugPrint('📸 takePicture called');
      final file = await _cameraController.takePicture();
      final xFlip = _isUsingFrontCamera();
      final capturedImageDataBuilder = CapturedImageDataBuilder();
      capturedImageDataBuilder.setImagePath(file.path).setXFlip(xFlip);
      if (!mounted) return;
      _helperInstant.lock();
      await context.router.push(
        ImagePreviewRoute(capturedImageDataBuilder: capturedImageDataBuilder),
      );
      _helperInstant.unlock();
    } on Exception catch (e, stack) {
      debugPrint('❌ Error during takePicture or navigation: $e');
      debugPrint('📌 Stack trace:\n$stack');
    }
  }

  @override
  void onLeftButtonTap() async {
    final current = _cameraController.value.flashMode;
    final next = current == FlashMode.off ? FlashMode.torch : FlashMode.off;
    await _cameraController.setFlashMode(next);
    setState(() {});
  }

  @override
  void dispose() async {
    await _cameraController.dispose();
    _observer?.unsubscribe(this);
    super.dispose();
  }
}
