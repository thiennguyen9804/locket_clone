import 'package:flutter/material.dart';

class CommentInput extends StatelessWidget {
  CommentInput({super.key, required this.controller});
  late TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
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
          ),
          controller: controller,
          onSubmitted: (text) {
            Navigator.pop(context);
            print('Bạn vừa gửi: $text');
          },
        ),
      ),
    );
  }
}
