import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:locket_clone/core/mapper/newsfeed_mapper/newsfeed_mapper.auto_mappr.dart';
import 'package:locket_clone/core/mapper/post_local_mapper/post_local_mapper.dart';
import 'package:locket_clone/core/mapper/post_mapper/post_mapper.dart';
import 'package:locket_clone/data/model/all_post_local.dart';
import 'package:locket_clone/data/model/all_posts_res.dart';
import 'package:locket_clone/domain/entities/newsfeed_entity.dart';

@AutoMappr(
  [MapType<AllPostsRes, NewsfeedEntity>(reverse: true)],
  includes: [PostMapper()],
)
class NewsfeedMapper extends $NewsfeedMapper {}
