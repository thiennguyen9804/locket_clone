import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:locket_clone/domain/entities/post_entity.dart';
import 'package:locket_clone/domain/entities/user_entity.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../core/configs/theme/app_theme.dart';

class PostWidget extends StatelessWidget {
  final PostEntity postEntity;
  const PostWidget({super.key, required this.postEntity});

  Widget image(String path) {
    if (path.startsWith('http') || path.startsWith('https')) {
      // Remote path
      return CachedNetworkImage(imageUrl: path, fit: BoxFit.cover);
    } else {
      // Local path
      print('Local image path: $path');
      return Image.file(File(path), fit: BoxFit.cover);
    }
  }

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
                          child: image(postEntity.imageUrl)
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
                    postEntity.caption,
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
        SizedBox(height: 37),
        _userInfo(),
      ],
    );
  }

  Widget _userInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppTheme.mainColor,
            borderRadius: BorderRadius.circular(100),
          ),
          width: 33,
          height: 33,
          padding: EdgeInsets.all(5),
          child:
              postEntity.user.avatarUrl != null
                  ? CircleAvatar(
                    backgroundImage: NetworkImage(postEntity.user.avatarUrl!),
                  )
                  : Icon(
                    Icons.account_circle_outlined,
                    color: const Color.fromARGB(255, 27, 26, 26),
                  ),
        ),
        SizedBox(width: 11),
        Text(
          postEntity.user.name,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: AppTheme.mainColor,
            fontSize: 22,
            letterSpacing: 0.06 + 1,
          ),
        ),
        SizedBox(width: 8),
        Text(
          timeago.format(postEntity.createdAt.toLocal()),
          style: TextStyle(
            color: Color(0xffA1A1A1),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
