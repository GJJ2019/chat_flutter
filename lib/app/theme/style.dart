import 'package:flutter/material.dart';

/// [Style] class contains all style for app
class Style {
  // * app colors
  /// accent color
  static const Color accentColor = Color(0xFF9C27B0);

  /// shadow color
  static const Color shadowColor = Color(0xFFC5C5C5);

  /// icon color
  static const Color iconColor = Color(0xFF757575);

  /// unselected color
  static const Color unselectedColor = Color(0xFF9E9E9E);

  /// white color
  static const Color whiteColor = Color(0xFFFFFFFF);

  /// background color
  static const Color backgroundColor = Color(0xFFF3F3F8);

  /// black color
  static const Color blackColor = Color(0xFF000000);

  /// transparent color
  static const Color transparentColor = Color(0x00000000);

  /// green color
  static const Color greenColor = Color(0xFF43A047);

  /// app theme
  static final ThemeData themeData = ThemeData(
    fontFamily: 'Nunito',
    primarySwatch: Colors.purple,
    accentColor: accentColor,
    cursorColor: accentColor,
    primaryColor: accentColor,
    scaffoldBackgroundColor: whiteColor,
    buttonBarTheme: const ButtonBarThemeData(buttonHeight: 50),
    buttonTheme: ButtonThemeData(
      buttonColor: accentColor,
      textTheme: ButtonTextTheme.primary,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
  );
}

/// get extra bold large size text
const extraBoldLarge = TextStyle(fontSize: 20, fontWeight: FontWeight.w700);

/// get bold large size text
const boldLarge = TextStyle(fontSize: 18, fontWeight: FontWeight.w700);

/// get bold medium size text
const boldMedium = TextStyle(fontSize: 16, fontWeight: FontWeight.w700);

/// get extra bold large size text
const semiBoldExtraLarge = TextStyle(fontSize: 20, fontWeight: FontWeight.w600);

/// get bold large size text
const semiBoldLarge = TextStyle(fontSize: 18, fontWeight: FontWeight.w600);

/// get bold medium size text
const semiBoldMedium = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

/// get extra large size text
const extraLarge = TextStyle(fontSize: 20);

/// get large size text
const large = TextStyle(fontSize: 18);

/// get medium size text
const medium = TextStyle(fontSize: 16);

/// get small size text
const small = TextStyle(fontSize: 14);
