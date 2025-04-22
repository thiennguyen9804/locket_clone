import 'package:mmkv/mmkv.dart';
import 'package:sqflite/sqflite.dart';

Future setUpLocalDb() async {
  await MMKV.initialize();
}

