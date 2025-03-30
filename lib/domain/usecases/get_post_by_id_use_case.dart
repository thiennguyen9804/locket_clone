import 'package:dartz/dartz.dart';
import 'package:locket_clone/domain/repository/post_repository.dart';

import '../../core/usecases/usecase.dart';
import '../../set_up_sl.dart';
import '../entities/post_entity.dart';

class GetPostByIdUseCase implements UseCase<PostEntity, String> {
  @override
  Future<PostEntity> call({String? param}) async {
    return sl<PostRepository>().getPostById(param!);
  }
}
