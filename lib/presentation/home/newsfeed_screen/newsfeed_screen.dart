import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locket_clone/common/widgets/button/share_btn.dart';
import 'package:locket_clone/common/widgets/button/widget_btn.dart';
import 'package:locket_clone/common/widgets/transition_wrapper/transition_helper.dart';
import 'package:locket_clone/domain/repository/post_repository.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/bloc/newsfeed_cubit.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/bloc/newsfeed_state.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/widget/interact_bar.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/widget/post_widget.dart';
import 'package:locket_clone/set_up_sl.dart';

class NewsfeedScreen extends StatefulWidget {
  NewsfeedScreen({super.key, required this.controller});
  late TextEditingController controller;
  @override
  State<NewsfeedScreen> createState() => _NewsfeedScreenState();
}

class _NewsfeedScreenState extends State<NewsfeedScreen> {
  int? _currentPage;
  final Set<int> _writtenPostIds = {};

  Widget interactBar() {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 9),
        child: InteractBar(controller: widget.controller),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _helperIst.newsfeedController.addListener(() {
      final page = _helperIst.newsfeedController.page?.round();
      if (page != null && page != _currentPage) {
        _currentPage = page;
        _handleVisiblePageChanged(page);
      }
    });
  }

  void _handleVisiblePageChanged(int index) {
    final state = context.read<NewsfeedCubit>().state;
    if (state is NewsfeedLoaded) {
      if (index < state.newsfeedInfo.posts.length) {
        final post = state.newsfeedInfo.posts[index];

        if (!_writtenPostIds.contains(post.id)) {
          print('post $post with index: $index is written to db');
          _writtenPostIds.add(post.id);
          sl<PostRepository>().writePostToLocal(post);
        } else {
          print('post with id ${post.id} already exists in _writtenPostIds');
          _writtenPostIds.forEach((item) => print('Written post id: $item'));
        }
      }
    }
  }

  final _helperIst = TransitionHelper();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).viewPadding.top;
    return Stack(
      children: [
        Builder(
          builder: (context) {
            return Expanded(
              child: NotificationListener(
                onNotification: _helperIst.notificationHandler,
                child: BlocBuilder<NewsfeedCubit, NewsfeedState>(
                  builder: (context, state) {
                    if (state is NewsfeedInit) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.newspaper,
                              size: 60,
                              color: Colors.white,
                            ),
                            Text(
                              'Hiện chưa có bài viết nào để hiển thị',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      );
                    }
                    if (state is NewsfeedLoaded) {
                      var info = state.newsfeedInfo;
                      return PageView.builder(
                        physics: ClampingScrollPhysics(),
                        controller: _helperIst.newsfeedController,
                        scrollDirection: Axis.vertical,
                        itemCount:
                            info.posts.length + (info.isLastPage ? 0 : 1),
                        // info.posts.length,
                        itemBuilder: (context, index) {
                          if (index ==
                              info.posts.length - info.nextPageTrigger) {
                            if (mounted) {
                              print('call for next post list');
                              context.read<NewsfeedCubit>().loadPosts();
                            }
                          }
                          // print('NewsfeedScreen build pageview $index');
                          return Padding(
                            padding: EdgeInsets.only(top: height + 100),
                            child: PostWidget(postEntity: info.posts[index]),
                          );
                        },
                      );
                    }
                    return Container();
                  },
                ),
              ),
            );
          },
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [WidgetBtn(), interactBar(), ShareBtn()],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
