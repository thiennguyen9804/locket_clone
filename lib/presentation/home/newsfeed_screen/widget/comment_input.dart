import 'package:flutter/material.dart';
import 'package:locket_clone/presentation/home/newsfeed_screen/newsfeed_screen_root.dart';

class CommentInput extends StatefulWidget {
  final TextEditingController commentController;
  final VoidCallback commentHandler;
  const CommentInput({
    super.key,
    required this.commentController,
    required this.commentHandler,
  });

  @override
  State<CommentInput> createState() => _CommentInputState();
}

class _CommentInputState extends State<CommentInput> {
  bool _canSend = false;
  Widget sendIcon() {
    return IconButton(
      icon: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xffECF4F4).withAlpha(_canSend ? 255 : 153),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.send_rounded,
          color: Color(0xff738F81).withAlpha(_canSend ? 255 : 153),
        ),
      ),
      onPressed:
          _canSend
              ? () {
                widget.commentHandler();
                Navigator.pop(context);
              }
              : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 5,
        left: 10,
        right: 10,
      ),
      child: TextField(
        onChanged: (value) {
          setState(() {
            _canSend = value.isNotEmpty;
          });
        },
        autofocus: true,
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffAAC2B3),
          hintText: 'Nhập tin nhắn...',
          hintStyle: TextStyle(color: Colors.white70),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(900),
            borderSide: BorderSide.none,
          ),
          suffixIcon: sendIcon(),
          // contentPadding: EdgeInsets.symmetric(vertical: 12),
        ),

        controller: widget.commentController,
      ),
    );
  }
}
