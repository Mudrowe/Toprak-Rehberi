import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

class TDropdownMenuTheme {
  TDropdownMenuTheme._();

  // Light Theme
  static final lightDropdownButtonTheme = DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight, horizontal: 20),
      filled: true,
      fillColor: TColors.light,
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: TColors.primaryColor),
        borderRadius: BorderRadius.circular(TSizes.buttonRadius),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: TColors.primaryColor),
        borderRadius: BorderRadius.circular(TSizes.buttonRadius),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: TColors.primaryColor, width: 2.0),
        borderRadius: BorderRadius.circular(TSizes.buttonRadius),
      ),
    ),
    menuStyle: MenuStyle(
      backgroundColor: WidgetStateProperty.all(TColors.light),
    ),

  );

  // Dark Theme
  static final darkDropdownButtonTheme = DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight, horizontal: 20),
      filled: true,
      fillColor: TColors.dark,
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: TColors.light),
        borderRadius: BorderRadius.circular(TSizes.buttonRadius),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: TColors.light),
        borderRadius: BorderRadius.circular(TSizes.buttonRadius),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: TColors.light, width: 2.0),
        borderRadius: BorderRadius.circular(TSizes.buttonRadius),
      ),
    ),
    menuStyle: MenuStyle(
      backgroundColor: WidgetStateProperty.all(TColors.dark),
    ),
  );
}
