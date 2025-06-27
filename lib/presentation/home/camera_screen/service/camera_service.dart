import 'package:camera/camera.dart';

class CameraService {
  late CameraController cameraController;
  Future<void>? initializeFuture;
  List<CameraDescription> cameras = [];
  int selectedCameraIndex = 0;

  Future<void> init() async {
    cameras = await availableCameras();
    selectedCameraIndex = 0;
    await _initialize(cameras[selectedCameraIndex]);
  }

  Future<void> switchCamera() async {
    selectedCameraIndex = (selectedCameraIndex + 1) % cameras.length;
    await cameraController.dispose();
    await _initialize(cameras[selectedCameraIndex]);
  }

  bool isUsingFrontCamera() =>
      cameras[selectedCameraIndex].lensDirection == CameraLensDirection.front;

  Future<XFile> takePicture() async {
    return await cameraController.takePicture();
  }

  Future<void> dispose() async {
    await cameraController.dispose();
  }

  Future<void> _initialize(CameraDescription description) async {
    cameraController = CameraController(description, ResolutionPreset.max);
    initializeFuture = cameraController.initialize();
  }
}
