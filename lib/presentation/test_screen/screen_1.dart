import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.redAccent),
      child: Center(
        child: Text('Screen 1', style: TextTheme.of(context).bodyLarge),
      ),
    );
  }
}
