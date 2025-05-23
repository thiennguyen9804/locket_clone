import 'package:flutter/widgets.dart';

class CommentHelper {
  CommentHelper._privateConstructor();

  static final CommentHelper _singleton = new CommentHelper._privateConstructor();

  factory CommentHelper() {
    return _singleton;
  }

  final controller = TextEditingController();
  void comentHandler() {
    
  }
}