// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:locket_clone/data/model/post_dto/post_dto.dart';
import 'package:locket_clone/data/model/post_local_data.dart';

class AllPostLocal {
  List<PostLocalData> posts;
  int totalPosts; // tong so post
  int totalPostsCurrent; // tong so post hien co trong local
  AllPostLocal({
    required this.posts,
    required this.totalPosts,
    required this.totalPostsCurrent,
  });

  @override
  String toString() => 'AllPostLocal(posts: $posts, totalPosts: $totalPosts, totalPostsCurrent: $totalPostsCurrent)';
}
