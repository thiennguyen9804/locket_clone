import 'package:flutter/material.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/newsfeed_screen_root.dart';

class CommentInput extends StatelessWidget {
  final TextEditingController commentController;
  final VoidCallback commentHandler;
  const CommentInput({
    super.key,
    required this.commentController,
    required this.commentHandler,
  });

  Widget sendIcon() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 5,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Color(0xffAAC2B3),
          borderRadius: BorderRadius.circular(40),
        ),
        child: TextField(
          autofocus: true,
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Nhập tin nhắn...',
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
            // suffix: sendIcon(),
          ),

          controller: commentController,
        ),
      ),
    );
  }
}
