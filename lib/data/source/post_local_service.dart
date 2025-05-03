import 'dart:isolate';

import 'package:locket_clone/data/app_database.dart';
import 'package:locket_clone/data/model/all_post_local.dart';
import 'package:locket_clone/data/model/all_posts_res.dart';
import 'package:locket_clone/data/model/post_dto/post_dto.dart';
import 'package:locket_clone/data/model/post_local_data.dart';
import 'package:mmkv/mmkv.dart';
import 'package:sqflite/sqflite.dart';

abstract class PostLocalService {
  Future<AllPostLocal?> loadLocalPosts(int size, DateTime? cursorCreatedAt);
  Future writePostToLocal(PostLocalData post);
  Future resetTable();
  void writeTotalPosts(int totalPosts);
  int readTotalPosts();
  Future deleteLocalPostById(int id);
}

class PostLocalServiceImpl implements PostLocalService {
  final Database db;
  final table = 'posts';
  late MMKV mmkv;
  Set<int> written = {};

  PostLocalServiceImpl(this.db) {
    mmkv = MMKV.defaultMMKV();
  }
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
      print('cursor: ${cursorCreatedAt}');
      print('cursor in epoch: ${cursorCreatedAt.millisecondsSinceEpoch}');
      data = await db.query(
        table,
        where: 'createdAt < ?',
        whereArgs: [cursorCreatedAt.millisecondsSinceEpoch],
        orderBy: 'createdAt DESC',
        limit: size,
      );
    }

    if (data.isEmpty) {
      print('PostLocalServiceImpl return null');
      return null;
    }

    print('PostLocalServiceImpl $data');
    res = data.map((item) => PostLocalData.fromMap(item)).toList();
    final totalPosts = readTotalPosts();
    return AllPostLocal(
      posts: res,
      totalPosts: totalPosts,
      totalPostsCurrent: res.length,
    );
  }

  @override
  Future writePostToLocal(PostLocalData post) async {
    // if(written.contains(post.id)) {
    //   return;
    // }
    final map = post.toMap()..remove('interactionList');
    await db.insert(table, map, conflictAlgorithm: ConflictAlgorithm.ignore);
    written.add(post.id);
  }

  @override
  Future resetTable() async {
    await db.delete(table);
    removeTotalPosts();
  }

  @override
  void writeTotalPosts(int totalPosts) {
    mmkv.encodeInt('totalPosts', totalPosts);
  }

  @override
  int readTotalPosts() {
    return mmkv.decodeInt('totalPosts');
  }

  void removeTotalPosts() {
    mmkv.removeValue('totalPosts');
  }
  
  @override
  Future deleteLocalPostById(int id) async {
    await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
