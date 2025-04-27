import 'package:locket_clone/data/model/user_dto/user_dto.dart';
import 'package:sqflite/sqflite.dart';

abstract class UserLocalService {
  Future writeUserToLocal(UserDto user);
  Future resetTable();

  Future<UserDto> getLocalUserById(int id);
}

class UserLocalServiceImpl implements UserLocalService {
  final Database db;
  final table = 'users';

  UserLocalServiceImpl(this.db);

  @override
  Future writeUserToLocal(UserDto user) async {
    await db.insert(
      table,
      user.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  
  @override
  Future resetTable() async {
    await db.delete(table);
  }
  
  @override
  Future<UserDto> getLocalUserById(int id) async {
    final user = await db.query(table, where: 'id = ?', whereArgs: [id]);
    return UserDto.fromJson(user.first);
  }
}
