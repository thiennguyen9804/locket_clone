import 'package:locket_clone/domain/entities/post_entity.dart';

class NewsFeedInfoUi {
  int pageNumber = 0;
  final numberOfPostsPerRequest = 1;
  List<PostEntity> posts = [];
  bool isLastPage = false;
  final int nextPageTrigger = 1;
  late int totalPosts;

  @override
  String toString() {
    return 'NewsFeedInfo{pageNumber: $pageNumber, numberOfPostsPerRequest: $numberOfPostsPerRequest, posts: $posts, isLastPage: $isLastPage, nextPageTrigger: $nextPageTrigger}';
  }
}
