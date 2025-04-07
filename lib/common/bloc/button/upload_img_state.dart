
part of 'upload_img_cubit.dart'; // Khai báo part of phải là dòng đầu tiên

@immutable
sealed class UploadImgState {}

final class CaptureState extends UploadImgState {}

final class SendImageState extends UploadImgState {}

final class SendImageLoading extends UploadImgState {}

final class SendImageSuccess extends UploadImgState {}
