import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locket_clone/domain/entities/newsfeed_entity.dart';
import 'package:locket_clone/domain/entities/post_entity.dart';
import 'package:locket_clone/domain/repository/post_repository.dart';
import 'package:locket_clone/presentation/data/news_feed_info_ui.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/bloc/newsfeed_state.dart';
import 'package:locket_clone/set_up_sl.dart';

class NewsfeedCubit extends Cubit<NewsfeedState> {
  NewsFeedInfoUi _info = NewsFeedInfoUi();
  DateTime? _cursor;
  void resetNewsFeedInRam() {
    print('reset newsfeed in ram');
    _info = NewsFeedInfoUi();
    emit(NewsfeedLoaded(newsfeedInfo: _info));
    _cursor = null;
  }

  NewsfeedCubit() : super(NewsfeedInit());

  // void loadPosts() async {
    
  //   final NewsfeedEntity results = await sl<PostRepository>().getAllPosts(
  //     size: _info.numberOfPostsPerRequest,
  //     cursorCreatedAt: _cursor,
  //   );

  //   if (results.posts.isEmpty) {
  //     return;
  //   }
  //   _cursor = results.posts.last.createdAt;
  //   print('newsfeed info $_info');
  //   emit(
  //     NewsfeedLoaded(
  //       newsfeedInfo:
  //           _info
  //             ..isLastPage = results.posts.isEmpty
  //             ..pageNumber = _info.pageNumber + 1
  //             ..posts.addAll(results.posts),
  //     ),
  //   );
  // }


  
}
