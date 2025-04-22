import 'package:locket_clone/data/app_database.dart';
import 'package:locket_clone/data/model/all_post_local.dart';
import 'package:locket_clone/data/model/all_posts_res.dart';

abstract class PostLocalService {
  Future<AllPostLocal?> loadLocalPosts(int size, int page);
}

class PostLocalServiceImpl implements PostLocalService {
  final db = AppDatabase().database;
  @override
  Future<AllPostLocal?> loadLocalPosts(int size, int page) async {
    
  }

}