import 'package:locket_clone/data/app_database.dart';
import 'package:locket_clone/data/model/all_post_local.dart';
import 'package:locket_clone/data/model/all_posts_res.dart';
import 'package:locket_clone/data/model/post_dto/post_dto.dart';
import 'package:locket_clone/data/model/post_local_data.dart';
import 'package:sqflite/sqflite.dart';

abstract class PostLocalService {
  Future<AllPostLocal?> loadLocalPosts(int size, DateTime? cursorCreatedAt);
  Future writePostToLocal(PostLocalData post);

  Future resetTable();
}

class PostLocalServiceImpl implements PostLocalService {
  final Database db;
  final table = 'posts';

  PostLocalServiceImpl(this.db);
  @override
  Future<AllPostLocal?> loadLocalPosts(
    int size,
    DateTime? cursorCreatedAt,
  ) async {
    List<PostLocalData>? res;
    List data;
    if (cursorCreatedAt == null) {
      data = await db.query(table, orderBy: 'createdAt DESC', limit: size);
    } else {
      print('cursor: ${cursorCreatedAt.millisecondsSinceEpoch}');
      data = await db.query(
        table,
        where: 'createdAt < ?',
        whereArgs: [cursorCreatedAt.millisecondsSinceEpoch],
        orderBy: 'createdAt DESC',
        limit: size,
      );
      // data = await db.rawQuery('''
      //   SELECT * FROM $table
      //   WHERE createdAt < ${cursorCreatedAt.microsecondsSinceEpoch}
      //   ORDER BY 'createdAt DESC'
      //   ''');
    }

    if (data.isEmpty) {
      print('PostLocalServiceImpl return null');
      return null;
    }

    print('PostLocalServiceImpl $data');
    res = data.map((item) => PostLocalData.fromMap(item)).toList();
    return AllPostLocal(
      posts: res,
      totalPosts: 10,
      totalPostsCurrent: res.length,
    );
  }

  @override
  Future writePostToLocal(PostLocalData post) async {
    final map = post.toMap()..remove('interactionList');
    await db.insert(table, map, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future resetTable() async {
    await db.delete(table);
  }
}
