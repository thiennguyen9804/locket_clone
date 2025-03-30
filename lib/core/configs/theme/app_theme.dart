// import 'package:flutter/material.dart';
//
// class AppTheme {
//   static final appTheme = ThemeData(
//       primaryColor: const Color(0xff3461FD),
//       scaffoldBackgroundColor: Colors.white,
//       brightness: Brightness.light,
//       snackBarTheme: const SnackBarThemeData(
//         backgroundColor: Colors.black87,
//         contentTextStyle: TextStyle(color: Colors.white),
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//           filled: true,
//           fillColor: const Color(0xffF5F9FE),
//           hintStyle: const TextStyle(
//             color: Color(0xff7C8BA0),
//             fontWeight: FontWeight.w400,
//           ),
//           contentPadding: const EdgeInsets.all(16),
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(16),
//               borderSide: BorderSide.none
//           ),
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(16),
//               borderSide: BorderSide.none
//           )
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xff3461FD),
//               elevation: 0,
//               textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16)
//               )
//           )
//       )
//   );
// }

import 'package:flutter/material.dart';

class AppTheme {
  static final mainColor = const Color(0xff738F81);
  static final bigText = TextStyle(
    color: Color(0xff738F81),
    fontSize: 52,
    fontWeight: FontWeight.w800,
    shadows: <Shadow>[
      Shadow(
          offset: Offset(0, 4),
          blurRadius: 4.0,
          color: Color.fromARGB(25, 0, 0, 0)),
    ],
  );
  static final outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
      foregroundColor: Color(0xff738F81),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Color(0xff949494), // your color here
          width: 1,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
    ),
  );
  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xff738F81),
      foregroundColor: Colors.white,
      elevation: 0,
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
    ),
  );
  static final appTheme = ThemeData(
    elevatedButtonTheme: elevatedButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Color(0xff738F81),
        textStyle: TextStyle(
          fontWeight: FontWeight.normal
        )
      ),
    )
  );
}
