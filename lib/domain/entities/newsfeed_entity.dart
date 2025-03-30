import 'package:locket_clone/domain/entities/post_entity.dart';

class NewsfeedEntity {
  List<PostEntity> posts;
  int totalPosts;
  NewsfeedEntity({
    required this.posts,
    required this.totalPosts,
  });

  @override
  String toString() => 'NewsfeedEntity(posts: $posts, totalPosts: $totalPosts)';
}
