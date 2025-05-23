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
      // isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (modalContext) {
        return Builder(
          builder: (innerContext) {
            return CommentInput(
              commentController: controller,
              commentHandler: commentHandler,
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

  Widget emojiBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [loveIc, sadIc, fireIc, moreIc],
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
