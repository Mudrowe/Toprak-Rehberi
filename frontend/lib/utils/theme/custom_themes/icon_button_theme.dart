import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';

class TIconButtonTheme {
  TIconButtonTheme._();

  static IconButtonThemeData iconButtonTheme = const IconButtonThemeData(
      style: ButtonStyle(
        //backgroundColor: WidgetStatePropertyAll<Color>(TColors.primaryColor),
        iconColor: WidgetStatePropertyAll<Color>(TColors.primaryColor),
  ));
}
