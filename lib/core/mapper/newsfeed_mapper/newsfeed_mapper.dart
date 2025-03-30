import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:locket_clone/core/mapper/newsfeed_mapper/newsfeed_mapper.auto_mappr.dart';
import 'package:locket_clone/core/mapper/post_mapper/post_mapper.auto_mappr.dart';
import 'package:locket_clone/core/mapper/post_mapper/post_mapper.dart';
import 'package:locket_clone/data/model/all_posts_res.dart';
import 'package:locket_clone/domain/entities/newsfeed_entity.dart';

@AutoMappr([
  MapType<AllPostsRes, NewsfeedEntity>(),
  MapType<NewsfeedEntity, AllPostsRes>(), // Cho phép ánh xạ 2 chiều
], includes: [
  PostMappr()
])
class NewsfeedMappr extends $NewsfeedMappr {}
