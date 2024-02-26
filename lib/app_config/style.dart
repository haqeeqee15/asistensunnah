import 'package:flutter/material.dart';

class AppTheme {
  static String fontFamily = 'Outfit';
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 48, 110, 91),
    hintColor: const Color(0xff979ca7),
    primaryColor: Colors.black,
    primaryColorDark: Colors.black,
    fontFamily: fontFamily,

    ///appBar theme
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
      elevation: 0,
      backgroundColor: Color.fromARGB(255, 48, 110, 91),
    ),

    ///text theme
    textTheme: const TextTheme(
      titleSmall: TextStyle(),
      titleLarge: TextStyle(),
      bodyLarge: TextStyle(),
      labelLarge: TextStyle(),
      bodySmall: TextStyle(
        color: Color(0xff979ca7),
      ), //caption
    ),
    colorScheme: ColorScheme.fromSwatch(
      backgroundColor: Color.fromARGB(255, 36, 2, 62),
    ),
  );
}

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5
