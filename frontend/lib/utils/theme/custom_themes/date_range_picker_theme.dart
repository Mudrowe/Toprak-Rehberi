import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

class TDateRangePickerTheme {
  TDateRangePickerTheme._();

  static ThemeData lightDateRangePickerTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: TColors.primaryColor,
      onPrimary: TColors.light,
      surface: TColors.light,
      secondary: TColors.softGreen,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: TColors.dark,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        iconSize: TSizes.iconMd,
      ),
    ),
  );

  static ThemeData darkDateRangePickerTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: TColors.primaryColor,
      onPrimary: TColors.light,
      surface: TColors.dark,
      secondary: TColors.darkerGrey,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: TColors.light,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        iconSize: TSizes.iconMd,
      ),
    ),
  );
}
