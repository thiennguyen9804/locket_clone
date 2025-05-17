import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locket_clone/common/widgets/transition_wrapper/transition_wrapper.dart';
import 'package:locket_clone/core/configs/theme/app_theme.dart';
import 'package:locket_clone/presentation/auth/bloc/keep_logged_in_cubit.dart';
import 'package:locket_clone/presentation/auth/pages/sign_in_screen.dart';
import 'package:locket_clone/presentation/test_screen.dart';
import 'package:locket_clone/set_up_fcm.dart';
import 'package:locket_clone/set_up_local_db.dart';
import 'package:locket_clone/set_up_sl.dart';

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
    return MaterialApp(
      title: 'Locket clone',
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      home: BlocProvider<KeepLoggedInCubit>(
        create: (BuildContext context) {
          return KeepLoggedInCubit()..execute();
        },
        child: BlocListener<KeepLoggedInCubit, KeepLoggedInState>(
          listener: (context, snapshot) {
            if (snapshot is KeepLoggedInFail) {
              // print("cannot logged in current user ${snapshot.msg}");
            }
          },
          child: BlocBuilder<KeepLoggedInCubit, KeepLoggedInState>(
            builder: (context, state) {
              switch (state) {
                case KeepLoggedInInitial() || KeepLoggedInSuccess():
                  return TransitionWrapper();
                case KeepLoggedInFail():
                  return SignInScreen();
              }
            },
          ),
        ),
      ),
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
      debugShowCheckedModeBanner: false,
      home: const TestScreen()
    );
  }
}