import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';

class TRadioTheme {
  TRadioTheme._();

  static RadioThemeData lightRadioTheme = const RadioThemeData(
    fillColor: WidgetStatePropertyAll<Color>(TColors.primaryColor),
    overlayColor: WidgetStatePropertyAll<Color>(TColors.primaryColor),
  );

  static RadioThemeData darkRadioTheme = const RadioThemeData(
    fillColor: WidgetStatePropertyAll<Color>(TColors.light),
    overlayColor: WidgetStatePropertyAll<Color>(TColors.light),
  );
}