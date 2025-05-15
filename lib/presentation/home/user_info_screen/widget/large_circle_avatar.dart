import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LargeCircleAvatar extends StatelessWidget {
  final String imageUrl;
  const LargeCircleAvatar(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148,
      height: 148,
      padding: EdgeInsets.all(13),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffAAC2B3),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: Offset(0, 4),
            color: Color(0xff667770).withAlpha(154),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 3),
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
      ),
    );
  }
}
