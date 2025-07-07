import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:locket_clone/core/configs/theme/app_theme.dart';
import 'package:locket_clone/presentation/test_screen/test_screen.dart';
import 'package:locket_clone/set_up_fcm.dart';
import 'package:locket_clone/set_up_local_db.dart';
import 'package:locket_clone/set_up_sl.dart';

import 'presentation/router/app_router.dart';

void main() async {
  runMain();
  // runTest();
}

void runTest() async {
  runApp(TestApp());
}

void runMain() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black,
      statusBarBrightness: Brightness.dark,
    ),
  );
  await Firebase.initializeApp();
  await setUpLocalDb();
  await setUpSl();
  await setUpFcm();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MaterialApp.router(
      title: 'Locket clone',
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
    );
  }
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Locket clone',
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: true,
      home: const TestScreen(),
    );
  }
}
