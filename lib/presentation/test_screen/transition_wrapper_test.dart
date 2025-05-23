import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locket_clone/presentation/test_screen/screen_1.dart';
import 'package:locket_clone/presentation/test_screen/screen_2.dart';
import 'package:locket_clone/presentation/test_screen/screen_root.dart';

class TransitionWrapperTest extends StatelessWidget {
  const TransitionWrapperTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          Screen1(),
          ScreenRoot(child: Screen2())
        ],
      ),
    );
  }
}