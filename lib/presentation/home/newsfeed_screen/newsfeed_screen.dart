import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locket_clone/common/widgets/button/share_btn.dart';
import 'package:locket_clone/common/widgets/button/widget_btn.dart';
import 'package:locket_clone/common/widgets/transition_wrapper/transition_helper.dart';
import 'package:locket_clone/domain/entities/post_entity.dart';
import 'package:locket_clone/domain/repository/post_repository.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/bloc/newsfeed_cubit.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/bloc/newsfeed_state.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/widget/interact_bar.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/widget/post_widget.dart';
import 'package:locket_clone/set_up_sl.dart';

import 'package:logging/logging.dart';

const _outColor = Color(0xffAAC2B3);
const _inColor = Color(0xffECF4F4);


class NewsfeedScreen extends StatefulWidget {
  NewsfeedScreen({super.key, required this.controller});
  late TextEditingController controller;
  @override
  State<NewsfeedScreen> createState() => _NewsfeedScreenState();
}

class _NewsfeedScreenState extends State<NewsfeedScreen> {
  int? _currentPage;
  PostEntity? currentPost;
  final Set<int> _writtenPostIds = {};
  final log = Logger('NewsfeedScreen');



  Widget backToCamBtn({Color outColor = _outColor, Color inColor = _inColor}) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        color: outColor,
      ),
      padding: EdgeInsets.all(5),
      child: Container(
        width: 83,
        height: 83,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          color: inColor,
        ),
        padding: EdgeInsets.symmetric(horizontal: 23, vertical: 23),
      ),
    );
  }

  Widget interactBar() {
    print('currentPost: $currentPost');
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0),
      child: InteractBar(controller: widget.controller),
    );
  }

  @override
  void initState() {
    super.initState();
    _helperIst.newsfeedController.addListener(() {
      final page = _helperIst.newsfeedController.page?.round();
      if (page != null && page != _currentPage) {
        // _currentPage = page;
        _handleVisiblePageChanged(page);
      }
    });
  }

  void _handleVisiblePageChanged(int index) {
    final state = context.read<NewsfeedCubit>().state;
    if (state is NewsfeedLoaded) {
      if (index < state.newsfeedInfo.posts.length) {
        final post = state.newsfeedInfo.posts[index];
        setState(() {
          currentPost = post;
        });
      }
    }
  }

  final _helperIst = TransitionHelper();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).viewPadding.top;
    return BlocProvider(
      create: (context) => NewsfeedCubit()..loadPosts(),
      child: Stack(
        children: [
          Builder(
            builder: (context) {
              return NotificationListener(
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
                              size: 80,
                              color: Colors.white,
                            ),
                            Text(
                              'Hiện chưa có bài viết\n nào để hiển thị',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                              textAlign: TextAlign.center,
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
                        onPageChanged: (value) {
                          print('onPagedChanged: $value');
                        },
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
              );
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 35,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<NewsfeedCubit, NewsfeedState>(
                      builder: (context, state) {
                        switch(state) {
                          case NewsfeedLoaded():
                            if(state.newsfeedInfo.posts.isNotEmpty) {
                              return interactBar();
                            }
                            return Container();
                          default:
                            return Container();
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [WidgetBtn(), backToCamBtn(), ShareBtn()],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
