import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:locket_clone/domain/repository/post_repository.dart';
import 'package:locket_clone/domain/repository/user_repository.dart';
import 'package:locket_clone/set_up_sl.dart';

final FirebaseMessaging _messaging = FirebaseMessaging.instance;

Future setUpFcm() async {
  NotificationSettings settings = await _messaging.requestPermission();
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    if (message.data.isNotEmpty) {
      print('fcm data: ${message.data}');
      // await resetTables();
    }
  });
}

Future resetTables() async {
  await sl<PostRepository>().resetTable();
  await sl<UserRepository>().resetTable();
}
