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
import 'package:locket_clone/core/extension/context_extensions.dart';
import 'package:locket_clone/domain/repository/post_repository.dart';
import 'package:locket_clone/presentation/data/captured_image_data.dart';
import 'package:locket_clone/presentation/home/camera_screen/widget/legacy_taken_image.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/bloc/newsfeed_cubit.dart';
import 'package:locket_clone/set_up_sl.dart';
import 'package:image/image.dart' as img;

// class LegacyCameraScreen extends StatefulWidget {
//   const LegacyCameraScreen({super.key});
//
//   @override
//   State<LegacyCameraScreen> createState() => _LegacyCameraScreenState();
// }
//
// class _LegacyCameraScreenState extends State<LegacyCameraScreen> {
//   late CameraController _cameraController;
//   Future<void>? _initializeControllerFuture;
//   List<CameraDescription> _cameras = [];
//   int _selectedCameraIndex = 0;
//   bool isCameraScreenActive = true;
//   XFile? pictureFile;
//   Isolate? imgFlipIso;
//   int? _currentPage;
//
//   // String caption;
//   TextEditingController captionController = TextEditingController();
//   final transHelper = TransitionHelper();
//
//   bool _isUsingFrontCamera() =>
//       _cameras[_selectedCameraIndex].lensDirection == CameraLensDirection.front;
//
//   void _takePicture() async {
//     setState(() {
//       isCameraScreenActive = false;
//     });
//     final file = await _cameraController.takePicture();
//
//     setState(() {
//       pictureFile = file;
//       // print('pictureFile after capture: ${pictureFile?.path}');
//     });
//   }
//
//   void _cancelHandler() async {
//     setState(() {
//       isCameraScreenActive = true;
//     });
//     if (pictureFile == null) {
//       return;
//     }
//     final file = File(pictureFile!.path);
//     if (await file.exists()) {
//       await file.delete();
//     } else {}
//
//     imgFlipIso?.kill(priority: Isolate.immediate);
//     pictureFile = null;
//   }
//
//   void _changeCam() async {
//     if (!isCameraScreenActive) {
//       return;
//     }
//     if (_cameras.isNotEmpty) {
//       _selectedCameraIndex = (_selectedCameraIndex + 1) % _cameras.length;
//       await _cameraController.dispose();
//       await _initializeCamera(_cameras[_selectedCameraIndex]);
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _initCamera();
//     // transHelper.mainController.addListener(() {
//     //   final page = transHelper.mainController.page?.round() ?? 0;
//     //   if (page != _currentPage) {
//     //     _currentPage = page;
//     //     // context.read<NewsfeedCubit>().resetNewsFeedInRam();
//     //   }
//     // });
//   }
//
//   Future<void> _initCamera() async {
//     _cameras = await availableCameras();
//     _selectedCameraIndex = 0;
//     await _initializeCamera(_cameras[_selectedCameraIndex]);
//   }
//
//   Future<void> _initializeCamera(CameraDescription cameraDescription) async {
//     _cameraController = CameraController(
//       cameraDescription,
//       ResolutionPreset.max,
//     );
//
//     _initializeControllerFuture = _cameraController.initialize();
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: MultiBlocProvider(
//         providers: [
//           BlocProvider<UploadImgCubit>(
//             create:
//                 (context) => UploadImgCubit(
//                   takePicture: _takePicture,
//                   onSendImageSuccess: onSendImageSuccess,
//                 ),
//           ),
//           BlocProvider(create: (context) => NewsfeedCubit()),
//         ],
//         child: BlocConsumer<UploadImgCubit, UploadImgState>(
//           listener: _handleUploadImgState,
//           builder: (context, state) {
//             return Column(
//               children: [
//                 SizedBox(height: 100),
//                 _buildCameraArea(),
//                 Spacer(),
//                 _buildControlBar(),
//                 SizedBox(height: 20),
//                 _newsfeedBtn(() {}),
//                 SizedBox(height: 50),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   void _handleUploadImgState(BuildContext context, UploadImgState state) {
//     if (state is CaptureState) {
//       transHelper.unlock?.call();
//     }
//     if (state is SendImageSuccess) {
//       _cancelHandler();
//       transHelper.unlock?.call();
//     } else if (state is SendImageLoading || state is ReadyToSendState) {
//       transHelper.lock?.call();
//     }
//   }
//
//   Widget _buildCameraArea() {
//     return isCameraScreenActive ? _cameraWidget() : _takenImageWidget();
//   }
//
//   Widget _buildControlBar() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 60),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           isCameraScreenActive ? FlashBtn() : cancelBtn(),
//           Spacer(),
//           captureBtn(),
//           Spacer(),
//           Opacity(
//             opacity: isCameraScreenActive ? 1 : 0,
//             child: ChangeCamButton(
//               onTap: isCameraScreenActive ? _changeCam : () {},
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void onSendImageSuccess() => _cancelHandler();
//
//   Widget cancelBtn() {
//     return Builder(
//       builder: (context) {
//         return CancelBtn(
//           onTap: () {
//             context.read<UploadImgCubit>().onCancel();
//             _cancelHandler();
//           },
//         );
//       },
//     );
//   }
//
//   Widget captureBtn() {
//     return Builder(
//       builder: (context) {
//         return CaptureBtn(
//           onSendImage: () {
//             final post = CapturedImageData(
//               imagePath: pictureFile!.path,
//               caption: captionController.text,
//               xFlip: _isUsingFrontCamera(),
//             );
//             // debugPrint('camera lens: ${_isFrontCam()}');
//             context.read<UploadImgCubit>().onSendImage(post);
//           },
//         );
//       },
//     );
//   }
//
//   Widget _newsfeedBtn(VoidCallback onTap) {
//     return Opacity(
//       opacity: isCameraScreenActive ? 1 : 0,
//       child: AnimPressable(icon: _newsfeed(), onTap: onTap),
//     );
//   }
//
//   Widget _newsfeed() {
//     return Column(
//       children: [
//         Text(
//           'Lịch sử',
//           style: TextStyle(
//             color: AppTheme.mainColor,
//             fontWeight: FontWeight.bold,
//             fontSize: 18,
//           ),
//         ),
//         Icon(
//           Icons.keyboard_arrow_down_rounded,
//           color: AppTheme.mainColor,
//           size: 30,
//         ),
//       ],
//     );
//   }
//
//   Widget _cameraWidget() {
//     final screenWidth = context.screenWidth;
//
//     if (_initializeControllerFuture == null) {
//       return SizedBox(
//         width: screenWidth,
//         height: screenWidth,
//         child: Center(
//           child: CircularProgressIndicator(color: AppTheme.mainColor),
//         ),
//       );
//     }
//
//     return FutureBuilder<void>(
//       future: _initializeControllerFuture,
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           return Container(
//             width: screenWidth,
//             height: screenWidth,
//             padding: EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Color(0xffBBBBBB),
//               border: Border.all(color: Color(0xffD0E2DE), width: 4),
//               borderRadius: BorderRadius.circular(40),
//             ),
//             child: Container(
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color.fromRGBO(115, 143, 129, 0.8),
//                     offset: Offset(0, 4),
//                     blurRadius: 4,
//                   ),
//                 ],
//                 borderRadius: BorderRadius.circular(40),
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(40),
//                 child: OverflowBox(
//                   alignment: Alignment.center,
//                   child: FittedBox(
//                     fit: BoxFit.fitWidth,
//                     child: SizedBox(
//                       width: screenWidth,
//                       height: screenWidth * _cameraController.value.aspectRatio,
//                       child: InnerShadow(
//                         shadows: [
//                           BoxShadow(
//                             color: Color.fromRGBO(236, 244, 244, 0.56),
//                             offset: Offset(0, 6),
//                             blurRadius: 8,
//                           ),
//                         ],
//                         child: Transform.flip(
//                           flipX: _isUsingFrontCamera(),
//                           child: CameraPreview(_cameraController),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         } else {
//           return SizedBox(
//             width: screenWidth,
//             height: screenWidth,
//             child: Center(
//               child: CircularProgressIndicator(color: AppTheme.mainColor),
//             ),
//           );
//         }
//       },
//     );
//   }
//
//   Widget _takenImageWidget() {
//     if (pictureFile == null) {
//       return Container();
//     }
//     final file = File(pictureFile!.path);
//     return LegacyTakenImage(
//       imageFile: file,
//       xFlip: _isUsingFrontCamera(),
//       controller: captionController,
//     );
//   }
//
//   @override
//   void dispose() async {
//     await _cameraController.dispose();
//     captionController.dispose();
//     super.dispose();
//   }
// }
