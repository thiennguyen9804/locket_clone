import 'package:flutter/material.dart';

class MyInteractBar extends StatelessWidget {
  const MyInteractBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      decoration: BoxDecoration(
        color: Color(0xffAAC2B3),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Color(0x8c738F81), width: 1),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 4,
            color: Color(0x92738F81),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.abc, color: Colors.white),
            Text('My Interact Bar', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
