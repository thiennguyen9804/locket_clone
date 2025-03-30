import 'package:dartz/dartz.dart';
import 'package:locket_clone/domain/entities/newsfeed_entity.dart';
import 'package:locket_clone/domain/entities/user_entity.dart';

import '../entities/post_entity.dart';

abstract class PostRepository {
  Future<PostEntity> getPostById(String postId);

  Future<NewsfeedEntity> getAllPosts({required int size, required int page});
}
