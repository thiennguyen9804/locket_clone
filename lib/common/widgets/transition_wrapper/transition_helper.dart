import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class TransitionHelper {
  int currentPage = 0;
  static final TransitionHelper _singleton = TransitionHelper._internal();
  final mainController = PageController(); // Controlled
  var newsfeedController = PageController(); // Controller
  VoidCallback? lock;
  VoidCallback? unlock;

  var topOverScroll = 0.0;
  // bool _locked = false;

  factory TransitionHelper() {
    return _singleton;
  }

  bool notificationHandler(Notification notification) {
    if (notification is OverscrollNotification && notification.overscroll < 0) {
      topOverScroll += notification.overscroll;
      mainController.position.correctPixels(
        mainController.position.pixels + notification.overscroll,
      );
      mainController.position.notifyListeners();
    }

    if (topOverScroll < 0) {
      if (notification is ScrollUpdateNotification) {
        final newOverScroll = min(
          notification.metrics.pixels + topOverScroll,
          0.0,
        );
        final diff = newOverScroll - topOverScroll;
        mainController.position.correctPixels(
          mainController.position.pixels + diff,
        );
        mainController.position.notifyListeners();
        topOverScroll = newOverScroll;
        newsfeedController.position.correctPixels(0);
        newsfeedController.position.notifyListeners();
      }
    }

    if (notification is UserScrollNotification &&
        notification.direction == ScrollDirection.idle &&
        topOverScroll != 0) {
      mainController.previousPage(
        curve: Curves.ease,
        duration: const Duration(milliseconds: 400),
      );
      topOverScroll = 0;
    }
    return false;
  }

  TransitionHelper._internal() {
    // mainController.addListener(() {
    //   final page = mainController.page?.round() ?? 0;
    //   if (page != currentPage) {
    //     currentPage = page;
    //   }
    // });
  }
}
