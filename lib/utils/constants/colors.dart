import 'package:flutter/material.dart';

class TColors {
  TColors._();
  // App theme colors
  static const Color primaryColor = Color(0xFF20854D);
  static const Color softGreen = Color(0xFFDEEDE4);
  static const Color middleGreen = Color(0xFFC5DFD0);

  // Text colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;
  
  // Background colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);

  // Background Container Colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = TColors.white.withOpacity(0.1);

  // Button colors
  static const Color buttonPrimary = TColors.primaryColor;
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border colors
  static const Color borderPrimary = TColors.primaryColor;
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and validation colors
  static const Color error = Color(0xFFD32D2F);
  static const Color success = Color(0XFF388E3C);
  static const Color warning = Color(0XFFF57C00);
  static const Color info = Color(0XFF1976D2);

  // Gradient Colors
  static const Gradient linearGradient =
      LinearGradient(colors: [Color(0x5f73B28E), Color(0xff20854d)]);
      
  static const recommendationGradient = LinearGradient(
    colors: [
      Color(0xFFFF96B6),
      Color(0xFFE4F2FF),
      Color(0xFFF4FE71),
      Color(0xFFFFFEFF),
    ],
    stops: [0, 0.37, 0.74, 1],
  );

  // Grading
  static const Color veryGood = Color(0xFF22D53E);
  static const Color good = Color(0xFF9DE168);
  static const Color mid = Color(0xFFFAFF0B);
  static const Color meh = Color(0xFFFFBF0B);
  static const Color bad = Color(0xFFDC2863);

  // Neutral Shades
  static const Color black = Color(0XFF232323);
  static const Color darkerGrey = Color(0XFF4F4F4F);
  static const Color darkGrey = Color(0XFF939393);
  static const Color grey = Color(0XFFE0E0E0);
  static const Color softGrey = Color(0XFFF4F4F4);
  static const Color lightGrey = Color(0XFFF9F9F9);
  static const Color white = Color(0XFFFFFFFF);
}
