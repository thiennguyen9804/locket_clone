import 'package:locket_clone/data/model/post_dto/post_dto.dart';

class AllPostLocal {
  List<PostDto> posts;
  int totalPosts;
  int size;
  AllPostLocal({
    required this.posts,
    required this.totalPosts,
    required this.size,
  });
}
