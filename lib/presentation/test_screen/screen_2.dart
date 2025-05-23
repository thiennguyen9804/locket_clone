import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locket_clone/presentation/test_screen/screen_root.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ScreenRoot.of(context).controller;
    return Container(
      decoration: BoxDecoration(color: Colors.blueAccent),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.white,
                  context: context,
                  builder: (context) {
                    return Center(child: TextField(controller: controller));
                  },
                );
              },
              child: Text('Comment'),
            ),
          ],
        ),
      ),
    );
  }
}
