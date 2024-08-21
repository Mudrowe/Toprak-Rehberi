import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';



class TTextButtonTheme {
  TTextButtonTheme._();


  // Light Theme 
  static final lightTextButtonTheme  = TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.primaryColor,
      textStyle: const TextStyle(fontSize: TSizes.fontSizeSm, color: TColors.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight, horizontal: 20),
    ),
  );

  // Dark Theme
  static final darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.light,
      textStyle: const TextStyle(fontSize: TSizes.fontSizeSm, color: TColors.textWhite, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight, horizontal: 20),
    ),
  );
}
