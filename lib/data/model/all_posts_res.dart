import 'package:locket_clone/data/model/post_dto/post_dto.dart';

class AllPostsRes {
  List<PostDto> posts;
  int totalPosts;
  AllPostsRes({
    required this.posts,
    required this.totalPosts,
  });
}
