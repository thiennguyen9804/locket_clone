import 'package:locket_clone/core/usecases/usecase.dart';
import 'package:locket_clone/domain/repository/user_repository.dart';
import 'package:locket_clone/presentation/data/captured_image_data.dart';
import 'package:locket_clone/set_up_sl.dart';

class UploadUserPostUseCase implements UseCase<void, CapturedImageData> {
  @override
  Future call({CapturedImageData? param}) async {
    // await sl<UserRepository>().addPost(param!);
  }
}
