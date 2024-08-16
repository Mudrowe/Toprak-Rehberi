import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';

class TRadioTheme {
  TRadioTheme._();

  static RadioThemeData radioTheme = const RadioThemeData(
    fillColor: WidgetStatePropertyAll<Color>(TColors.primaryColor),
    overlayColor: WidgetStatePropertyAll<Color>(TColors.primaryColor),
  );
}