import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locket_clone/common/widgets/button/share_btn.dart';
import 'package:locket_clone/common/widgets/button/widget_btn.dart';
import 'package:locket_clone/common/widgets/transition_wrapper/transition_helper.dart';
import 'package:locket_clone/data/source/auth_local_service.dart';
import 'package:locket_clone/domain/entities/post_entity.dart';
import 'package:locket_clone/presentation/data/news_feed_info_ui.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/bloc/newsfeed_cubit.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/interact_bar_status.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/newsfeed_screen_root.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/widget/my_interact_bar.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/widget/other_interact_bar.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/widget/post_widget.dart';

import 'package:logging/logging.dart';

import '../../../set_up_sl.dart';

const _outColor = Color(0xffAAC2B3);
const _inColor = Color(0xffECF4F4);

class NewsfeedScreen extends StatefulWidget {
  const NewsfeedScreen({super.key});
  @override
  State<NewsfeedScreen> createState() => _NewsfeedScreenState();
}

class _NewsfeedScreenState extends State<NewsfeedScreen> {
  var interactBarStatus = InteractBarStatus.LOADING;
  PostEntity? currentPost;
  final _helperIst = TransitionHelper();
  late final Function(int) onPostChanged;

  final log = Logger('NewsfeedScreen');

  @override
  void initState() {
    super.initState();
    _helperIst.newsfeedController.addListener(() {
      final newIndex = _helperIst.newsfeedController.page?.round();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    onPostChanged = NewsfeedScreenRoot.of(context).onPostChanged;
  }

  void _updateInteractBarForPost(PostEntity post) {
    onPostChanged(post.id);
    final currentUser = sl<AuthLocalService>().getLocalCurrentUser();
    setState(() {
      currentPost = post;
      if (post.user.id == currentUser.id) {
        interactBarStatus = InteractBarStatus.MY_INTERACT_BAR;
      } else {
        interactBarStatus = InteractBarStatus.OTHER_INTEARACT_BAR;
      }
    });
  }

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
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).viewPadding.top;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsfeedCubit()..loadPosts()),
      ],
      child: BlocListener<NewsfeedCubit, NewsFeedInfoUi>(
        listener: (context, state) {
          if (state.posts.isNotEmpty && currentPost == null) {
            _updateInteractBarForPost(state.posts[0]);
          } else if (state.posts.isEmpty) {
            setState(() {
              interactBarStatus = InteractBarStatus.NO_INTERACT_BAR;
              currentPost = null;
            });
          }
        },
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
                        onPageChanged: (index) {
                          final state = context.read<NewsfeedCubit>().state;
                          if (index < state.posts.length) {
                            _updateInteractBarForPost(state.posts[index]);
                          }
                        },
                        scrollDirection: Axis.vertical,
                        itemCount:
                            state.posts.length + (state.endReached ? 0 : 1),
                        itemBuilder: (context, index) {
                          var itemCount = state.posts.length;
                          if (index >= itemCount - 1 && !state.endReached) {
                            context.read<NewsfeedCubit>().loadPosts();
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
                      Builder(
                        builder: (context) {
                          final width = MediaQuery.of(context).size.width;
                          return AnimatedContainer(
                            width:
                                interactBarStatus ==
                                        InteractBarStatus.MY_INTERACT_BAR
                                    ? width * 0.6
                                    : width,
                            duration: const Duration(milliseconds: 400),
                            child: switch (interactBarStatus) {
                              InteractBarStatus.LOADING => Text('Loading...'),
                              InteractBarStatus.MY_INTERACT_BAR =>
                                MyInteractBar(
                                  interactList:
                                      currentPost?.interactionList ?? [],
                                ),
                              InteractBarStatus.OTHER_INTEARACT_BAR =>
                                OtherInteractBar(),
                              InteractBarStatus.NO_INTERACT_BAR => Container(),
                            },
                          );
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
      ),
    );
  }
}
