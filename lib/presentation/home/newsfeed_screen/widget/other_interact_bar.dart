import 'package:auto_route/auto_route.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/newsfeed_screen_root.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/widget/comment_input.dart';
import 'package:locket_clone/presentation/home/singleton/comment_helper.dart';

class OtherInteractBar extends StatefulWidget {
  OtherInteractBar({super.key});
  final commentHelper = CommentHelper();
  @override
  State<OtherInteractBar> createState() => _OtherInteractBarState();
}

class _OtherInteractBarState extends State<OtherInteractBar> {
  var isCommentBarOpen = false;
  final Widget loveIc = SvgPicture.asset(
    'assets/love_ic.svg',
    width: 20,
    height: 20,
  );

  final Widget sadIc = SvgPicture.asset(
    'assets/sad_ic.svg',
    width: 20,
    height: 20,
  );

  final Widget fireIc = SvgPicture.asset(
    'assets/fire_ic.svg',
    width: 20,
    height: 20,
  );

  final Widget moreIc = SvgPicture.asset(
    'assets/more_ic.svg',
    width: 20,
    height: 20,
  );

  void _showCommentInput(BuildContext context) {
    final controller = NewsfeedScreenRoot.of(context).commentController;
    final commentHandler = NewsfeedScreenRoot.of(context).commentHandler;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (modalContext) {
        return Builder(
          builder: (innerContext) {
            return CommentInput(
              commentController: controller,
              commentHandler: () {
                commentHandler();
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  Widget commentBar(BuildContext context) {
    return GestureDetector(
      onTap: () => _showCommentInput(context),
      child: Text(
        'Gửi tin nhắn',
        style: TextStyle(
          fontSize: 14,
          letterSpacing: 1.05,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  void _showEmojiPickerBottomSheet() {
    final emojiSelectedHandler =
        NewsfeedScreenRoot.of(context).emojiSelectedHandler;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.4,
          minChildSize: 0.2,
          maxChildSize: 0.6,
          builder:
              (_, controller) => Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: EmojiPicker(
                  onEmojiSelected: (_, emoji) {
                    emojiSelectedHandler(emoji);
                    context.router.pop();
                  },
                  config: Config(
                    emojiViewConfig: EmojiViewConfig(emojiSizeMax: 32),
                  ),
                ),
              ),
        );
      },
    );
  }

  Widget emojiBar() {
    return GestureDetector(
      onTap: _showEmojiPickerBottomSheet,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [loveIc, sadIc, fireIc, moreIc],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isCommentBarOpen ? 0 : 1,
      child: Container(
        height: 38,
        decoration: BoxDecoration(
          color: Color(0xffAAC2B3),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Color(0x8c738F81), width: 1),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 4,
              color: Color(0x92738F81),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: commentBar(context)),
              SizedBox(width: 16),
              Expanded(child: emojiBar()),
            ],
          ),
        ),
      ),
    );
  }
}
