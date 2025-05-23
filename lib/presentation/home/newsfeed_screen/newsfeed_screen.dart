import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locket_clone/common/widgets/button/share_btn.dart';
import 'package:locket_clone/common/widgets/button/widget_btn.dart';
import 'package:locket_clone/common/widgets/transition_wrapper/transition_helper.dart';
import 'package:locket_clone/domain/entities/newsfeed_entity.dart';
import 'package:locket_clone/domain/entities/post_entity.dart';
import 'package:locket_clone/domain/repository/post_repository.dart';
import 'package:locket_clone/presentation/data/news_feed_info_ui.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/bloc/interact_bar_cubit.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/bloc/newsfeed_cubit.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/bloc/newsfeed_state.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/widget/my_interact_bar.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/widget/other_interact_bar.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/widget/post_widget.dart';
import 'package:locket_clone/set_up_sl.dart';

import 'package:logging/logging.dart';

const _outColor = Color(0xffAAC2B3);
const _inColor = Color(0xffECF4F4);

class NewsfeedScreen extends StatefulWidget {
  NewsfeedScreen({super.key});
  @override
  State<NewsfeedScreen> createState() => _NewsfeedScreenState();
}

class _NewsfeedScreenState extends State<NewsfeedScreen> {
  int? _currentPage;
  PostEntity? currentPost;
  bool _initialized = false;
  final _helperIst = TransitionHelper();

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


  @override
  void initState() {
    super.initState();
    // _helperIst.newsfeedController.addListener(() {
    //   final page = _helperIst.newsfeedController.page?.round() ?? 0;
    // });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // _onPostAppeared(0);
  }

  void _onPostAppeared(int index) {
    final state = context.read<NewsfeedCubit>().state;
    if (index < state.posts.length + (state.endReached ? 0 : 1)) {
      final post = state.posts[index];
      debugPrint('Current post: $post!');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            currentPost = post;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).viewPadding.top;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsfeedCubit()..loadPosts()),
        BlocProvider(create: (context) => InteractBarCubit()),
      ],
      child: Stack(
        children: [
          Builder(
            builder: (context) {
              return NotificationListener(
                onNotification: _helperIst.notificationHandler,
                child: BlocBuilder<NewsfeedCubit, NewsFeedInfoUi>(
                  builder: (context, state) {
                    if (state.posts.isEmpty) {
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
                    return PageView.builder(
                      physics: ClampingScrollPhysics(),
                      controller: _helperIst.newsfeedController,
                      scrollDirection: Axis.vertical,
                      itemCount:
                          state.posts.length + (state.endReached ? 0 : 1),
                      itemBuilder: (context, index) {
                        var itemCount = state.posts.length;
                        if (index >= itemCount - 1 && !state.endReached) {
                          context.read<NewsfeedCubit>().loadPosts();
                        }
                        if (itemCount == 0) {
                          context.read<InteractBarCubit>().setNoInteractBar();
                        } else {
                          context.read<InteractBarCubit>().setInteractBar(
                            state.posts[index],
                          );
                        }
                        return Padding(
                          padding: EdgeInsets.only(top: height + 100),
                          child: PostWidget(postEntity: state.posts[index]),
                        );
                      },
                    );
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
                    BlocBuilder<InteractBarCubit, InteractBarState>(
                      builder: (context, state) {
                        final width = MediaQuery.of(context).size.width;
                        return AnimatedContainer(
                          width:
                              state is MyInteractBarState ? width * 0.6 : width,
                          duration: const Duration(milliseconds: 400),
                          child: switch (state) {
                            InteractBarLoading() => CircularProgressIndicator(),
                            MyInteractBarState() => MyInteractBar(),
                            OthersInteractBarState() => OtherInteractBar(),
                            NoInteractBar() => Container(),
                          },
                        );
                        // switch (state) {
                        //   case InteractBarLoading():
                        //     return CircularProgressIndicator();
                        //   case MyInteractBarState():
                        //     return MyInteractBar();
                        //   case OthersInteractBarState():
                        //     return OtherInteractBar(
                        //       controller: widget.controller,
                        //     );
                        //   case NoInteractBar():
                        //     return Container();
                        // }
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
