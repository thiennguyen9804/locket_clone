import 'package:locket_clone/core/usecases/usecase.dart';
import 'package:locket_clone/domain/repository/user_repository.dart';
import 'package:locket_clone/presentation/data/upload_post.dart';
import 'package:locket_clone/set_up_sl.dart';

class UploadUserPostUseCase implements UseCase<void, UploadPost> {
  @override
  Future call({UploadPost? param}) async {
    // await sl<UserRepository>().addPost(param!);
    
  }
}