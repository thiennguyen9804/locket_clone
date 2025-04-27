import 'package:locket_clone/presentation/data/news_feed_info_ui.dart';
import 'package:meta/meta.dart';

@immutable
sealed class NewsfeedState {}

class NewsfeedInit extends NewsfeedState {}

class NewsfeedLoaded extends NewsfeedState {
  final NewsFeedInfoUi newsfeedInfo;

  NewsfeedLoaded({required this.newsfeedInfo});
}

class EmptyNewsfeed extends NewsfeedState {}
