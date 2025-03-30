import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void customNavigate(BuildContext context, Widget screenX) {
  bool screenXExists = false;

  Navigator.popUntil(context, (route) {
    if (route is MaterialPageRoute && route.builder(context).runtimeType == screenX.runtimeType) {
      screenXExists = true;
      return true; // Dừng pop khi thấy màn hình X
    }
    return false;
  });

  if (!screenXExists) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screenX),
    );
  }
}
