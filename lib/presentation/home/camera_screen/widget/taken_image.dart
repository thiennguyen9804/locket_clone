import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';

class TakenImage extends StatelessWidget {
  final File imageFile;
  final bool xFlip;
  const TakenImage({
    super.key,
    required this.imageFile,
    required this.xFlip,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              width: size,
              height: size,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xffBBBBBB),
                border: Border.all(color: Color(0xffD0E2DE), width: 4),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(115, 143, 129, 0.8),
                      offset: Offset(0, 4),
                      blurRadius: 4,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: OverflowBox(
                    alignment: Alignment.center,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: SizedBox(
                        width: size,
                        height: size,
                        child: InnerShadow(
                          shadows: [
                            BoxShadow(
                              color: Color.fromRGBO(236, 244, 244, 0.56),
                              offset: Offset(0, 6),
                              blurRadius: 8,
                            ),
                          ],
                          child: Transform.flip(
                            flipX: xFlip,
                            child: Image.file(
                              imageFile,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: Color(0xffF2F2F2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'test caption',
                    style: TextStyle().copyWith(
                      color: Color(0xff5F5F5F),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 37,
        ),
      ],
    );
  }
}
