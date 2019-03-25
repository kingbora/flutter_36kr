import 'package:flutter/material.dart';

class MyTheme {
  static final androidTheme = new ThemeData(
    primaryColor: MaterialColor(
      0xFF333333,
      getCustomColor(0xFF333333),
    ),
    appBarTheme: AppBarTheme(
      color: Color(0xFFFEFEFE),
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: Color(0xFF333333),
        size: 24.0,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    indicatorColor: MaterialColor(
      0xFFA0A0A0,
      getCustomColor(0xFFA0A0A0),
    ),
    primaryTextTheme: TextTheme(
      title: TextStyle(
        color: Colors.black,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
      // subtitle: TextStyle(
      //   color: Color(0xFFAAAAAA),
      //   fontSize: 18.0,
      // ),
      // body1: TextStyle(
      //   color: Color(0xFF666666),
      // ),
      // body2: TextStyle(
      //   color: Color(0xFF333333)
      // )
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: Color(0xFFF8F8F8),
      elevation: 1.0,
    ),
  );

  static Map<int, Color> getCustomColor(int color) {
    return {
      50: Color(color),
      100: Color(color),
      200: Color(color),
      300: Color(color),
      400: Color(color),
      500: Color(color),
      600: Color(color),
      700: Color(color),
      800: Color(color),
      900: Color(color)
    };
  }
}