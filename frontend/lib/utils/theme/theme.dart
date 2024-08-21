import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/theme/custom_themes/alert_dialog_theme.dart';
import 'package:toprak_rehberi/utils/theme/custom_themes/appbar_theme.dart';
import 'package:toprak_rehberi/utils/theme/custom_themes/buttom_sheet_theme.dart';
import 'package:toprak_rehberi/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:toprak_rehberi/utils/theme/custom_themes/chip_theme.dart';
import 'package:toprak_rehberi/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:toprak_rehberi/utils/theme/custom_themes/icon_button_theme.dart';
import 'package:toprak_rehberi/utils/theme/custom_themes/navigation_bar_theme.dart';
import 'package:toprak_rehberi/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:toprak_rehberi/utils/theme/custom_themes/radio_theme.dart';
import 'package:toprak_rehberi/utils/theme/custom_themes/text_button_theme.dart';
import 'package:toprak_rehberi/utils/theme/custom_themes/text_field_theme.dart';
import 'package:toprak_rehberi/utils/theme/custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    disabledColor: TColors.grey,
    primaryColor: TColors.primaryColor,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: TColors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightButtomSheetTheme,
    elevatedButtonTheme: TElevatedButtonheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    textButtonTheme: TTextButtonTheme.lightTextButtonTheme,
    navigationBarTheme: TNavigationBarTheme.lightNavigationBarTheme,
    iconButtonTheme: TIconButtonTheme.iconButtonTheme,
    dialogTheme: TAlertDialogTheme.lightAlertDialogTheme,
    radioTheme: TRadioTheme.radioTheme,
  );


  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    disabledColor: TColors.grey,
    primaryColor: TColors.primaryColor,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    scaffoldBackgroundColor: TColors.black,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    textButtonTheme: TTextButtonTheme.darkTextButtonTheme,
    navigationBarTheme: TNavigationBarTheme.darkNavigationBarTheme,
    iconButtonTheme: TIconButtonTheme.iconButtonTheme,
    dialogTheme: TAlertDialogTheme.darkAlertDialogTheme,
    radioTheme: TRadioTheme.radioTheme,
  );
}
