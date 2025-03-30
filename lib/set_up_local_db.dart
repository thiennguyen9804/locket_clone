

import 'package:mmkv/mmkv.dart';

Future setUpLocalDb() async {
  await MMKV.initialize();
}