import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locket_clone/domain/entities/newsfeed_entity.dart';
import 'package:locket_clone/domain/entities/post_entity.dart';
import 'package:locket_clone/domain/repository/post_repository.dart';
import 'package:locket_clone/presentation/data/news_feed_info_ui.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/bloc/newsfeed_state.dart';
import 'package:locket_clone/set_up_sl.dart';

class NewsfeedCubit extends Cubit<NewsfeedState> {
  NewsFeedInfoUi info = NewsFeedInfoUi();
  DateTime? cursor;
  NewsfeedCubit() : super(NewsfeedInit());
  void loadPosts() async {
    final NewsfeedEntity results = await sl<PostRepository>().getAllPosts(
      size: info.numberOfPostsPerRequest,
      cursorCreatedAt: cursor,
    );

    if (results.posts.isEmpty) {
      emit(EmptyNewsfeed());
      return;
    }
    cursor = results.posts.last.createdAt;
    print('newsfeed info $info');
    emit(
      NewsfeedLoaded(
        newsfeedInfo:
            info
              ..isLastPage = results.posts.length < info.numberOfPostsPerRequest
              ..pageNumber = info.pageNumber + 1
              ..posts.addAll(results.posts),
      ),
    );
  }
}
