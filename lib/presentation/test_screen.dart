import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';
import 'package:locket_clone/common/widgets/transition_wrapper/transition_helper.dart';


final TransitionHelper transitionHelper = TransitionHelper();

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Indexer(
        children: [
          Indexed(
            index: 1,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 38.0,
                  right: 38.0,
                  top: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(color: Colors.redAccent),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(color: Colors.redAccent),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(color: Colors.redAccent),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Indexed(
            child: PageView(
              physics: const ClampingScrollPhysics(),
              controller: transitionHelper.mainController,
              scrollDirection: Axis.vertical,
              children: [Screen1(), Screen2()],
            ),
          ),
        ],
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Screen 1'));
  }
}

final list = [Sub1(), Sub2(), Sub3()];

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  bool _initialized = false;
  @override
  void initState() {
    super.initState();

    transitionHelper.newsfeedController.addListener(() {
      final page = transitionHelper.newsfeedController.page?.round() ?? 0;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_initialized) {
      _initialized = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        onSubPageAppeared(0);
      });
    }
  }

  void onSubPageAppeared(int index) {
    debugPrint('Sub page $index appeared!');
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: NotificationListener(
        onNotification: transitionHelper.notificationHandler,
        child: PageView.builder(
          controller: transitionHelper.newsfeedController,
          scrollDirection: Axis.vertical,
          itemCount: list.length,
          onPageChanged: (value) => onSubPageAppeared(value),
          itemBuilder: (context, index) {
            return list[index];
          },
        ),
      ),
    );
  }
}

class Sub1 extends StatelessWidget {
  const Sub1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Sub1'));
  }
}

class Sub2 extends StatelessWidget {
  const Sub2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Sub2'));
  }
}

class Sub3 extends StatelessWidget {
  const Sub3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Sub3'));
  }
}
