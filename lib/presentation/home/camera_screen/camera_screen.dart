import 'dart:io';
import 'dart:isolate';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:locket_clone/common/bloc/button/upload_img_cubit.dart';
import 'package:locket_clone/common/widgets/anim_pressable.dart';
import 'package:locket_clone/common/widgets/button/cancel_btn.dart';
import 'package:locket_clone/common/widgets/button/capture_btn.dart';
import 'package:locket_clone/common/widgets/button/change_cam_btn.dart';
import 'package:locket_clone/common/widgets/button/flash_btn.dart';
import 'package:locket_clone/common/widgets/button/send_btn.dart';
import 'package:locket_clone/common/widgets/transition_wrapper/transition_helper.dart';
import 'package:locket_clone/core/configs/theme/app_theme.dart';
import 'package:locket_clone/domain/repository/post_repository.dart';
import 'package:locket_clone/presentation/data/upload_post.dart';
import 'package:locket_clone/presentation/home/camera_screen/widget/taken_image.dart';
import 'package:locket_clone/set_up_sl.dart';
import 'package:image/image.dart' as img;

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  Future<void>? _initializeControllerFuture;
  List<CameraDescription> _cameras = [];
  int _selectedCameraIndex = 0;
  bool isCamScr = true;
  XFile? pictureFile;
  Isolate? imgFlipIso;
  // String caption;
  TextEditingController captionController = TextEditingController();
  final transHelper = TransitionHelper();

  bool _isFrontCam() =>
      _cameras[_selectedCameraIndex].lensDirection == CameraLensDirection.front;

  void _takePicture() async {
    setState(() {
      isCamScr = false;
    });
    final file = await _cameraController.takePicture();

    Isolate.run(() async {
      if (_isFrontCam()) {
        final imageFile = File(file.path);

        final bytes = await imageFile.readAsBytes();
        img.Image? image = img.decodeImage(bytes);

        image = img.flipHorizontal(image!);
        await imageFile.writeAsBytes(img.encodeJpg(image));
      }
      return null;
    });

    setState(() {
      pictureFile = file;
    });
  }

  void _cancelHandler() async {
    setState(() {
      isCamScr = true;
    });
    if (pictureFile == null) {
      return;
    }
    final file = File(pictureFile!.path);
    if (await file.exists()) {
      await file.delete();
      print("File đã bị xóa!");
    } else {
      print("File không tồn tại!");
    }

    imgFlipIso?.kill(priority: Isolate.immediate);
    pictureFile = null;
  }

  void _changeCam() async {
    if (!isCamScr) {
      return;
    }
    if (_cameras.isNotEmpty) {
      _selectedCameraIndex = (_selectedCameraIndex + 1) % _cameras.length;
      await _cameraController.dispose();
      await _initializeCamera(_cameras[_selectedCameraIndex]);
    }
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<UploadImgCubit>(
        create:
            (context) => UploadImgCubit(
              takePicture: _takePicture,
              onSendImageSuccess: onSendImageSuccess,
            ),
        child: BlocConsumer<UploadImgCubit, UploadImgState>(
          listener: (context, state) {
            print(state);
            if (state is CaptureState) {
              transHelper.unlock?.call;
            }
            if (state is SendImageSuccess) {
              _cancelHandler();
              transHelper.unlock?.call();
            } else if (state is SendImageLoading || state is SendImageState) {
              transHelper.lock?.call();
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(height: 100),
                isCamScr ? _cameraWidget() : _takenImageWidget(),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isCamScr ? FlashBtn() : cancelBtn(),
                      Spacer(),
                      captureBtn(),
                      Spacer(),
                      Opacity(
                        opacity: isCamScr ? 1 : 0,
                        child: ChangeCamBtn(
                          onTap: isCamScr ? _changeCam : () {},
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                _newsfeedBtn(() {}),
                SizedBox(height: 50),
              ],
            );
          },
        ),
      ),
    );
  }

  void onSendImageSuccess() {
    _cancelHandler();
  }

  Widget cancelBtn() {
    return Builder(
      builder: (context) {
        return CancelBtn(
          onTap: () {
            context.read<UploadImgCubit>().onCancel();
            _cancelHandler();
          },
        );
      },
    );
  }

  Widget captureBtn() {
    return Builder(
      builder: (context) {
        return CaptureBtn(
          onSendImage: () {
            context.read<UploadImgCubit>().onSendImage(
              UploadPost(
                imagePath: pictureFile!.path,
                caption: captionController.text,
              ),
            );
          },
        );
      },
    );
  }

  Widget _newsfeedBtn(VoidCallback onTap) {
    return Opacity(
      opacity: isCamScr ? 1 : 0,
      child: AnimPressable(icon: _newsfeed(), onTap: onTap),
    );
  }

  Widget _newsfeed() {
    return Column(
      children: [
        Text(
          'Lịch sử',
          style: TextStyle(
            color: AppTheme.mainColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Icon(
          Icons.keyboard_arrow_down_rounded,
          color: AppTheme.mainColor,
          size: 30,
        ),
      ],
    );
  }

  Widget _cameraWidget() {
    if (_initializeControllerFuture == null) {
      var size = MediaQuery.of(context).size.width;
      return SizedBox(
        width: size,
        height: size,
        child: Center(
          child: CircularProgressIndicator(color: AppTheme.mainColor),
        ),
      );
    }
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (BuildContext context, AsyncSnapshot snapShot) {
        var size = MediaQuery.of(context).size.width;
        if (snapShot.connectionState == ConnectionState.done) {
          return Container(
            width: size,
            height: size,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xffBBBBBB),
              border: Border.all(color: Color(0xffD0E2DE), width: 4),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(115, 143, 129, 0.8),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
                borderRadius: BorderRadius.circular(40),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: OverflowBox(
                  alignment: Alignment.center,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: SizedBox(
                      width: size,
                      height: size * _cameraController.value.aspectRatio,
                      child: InnerShadow(
                        shadows: [
                          BoxShadow(
                            color: Color.fromRGBO(236, 244, 244, 0.56),
                            offset: Offset(0, 6),
                            blurRadius: 8,
                          ),
                        ],
                        child: Transform.flip(
                          flipX: _isFrontCam(),
                          child: CameraPreview(_cameraController),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return SizedBox(
            width: size,
            height: size,
            child: Center(
              child: CircularProgressIndicator(color: AppTheme.mainColor),
            ),
          );
        }
      },
    );
  }

  Widget _takenImageWidget() {
    if (pictureFile == null) {
      return Container();
    }
    final file = File(pictureFile!.path);
    return TakenImage(
      imageFile: file,
      xFlip: _isFrontCam(),
      controller: captionController,
    );
  }

  @override
  void dispose() async {
    await _cameraController.dispose();
    captionController.dispose();
    super.dispose();
  }
}
