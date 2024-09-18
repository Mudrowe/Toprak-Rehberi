import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';

class TIconButtonTheme {
  TIconButtonTheme._();

  static IconButtonThemeData lightIconButtonTheme = const IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStatePropertyAll<Color>(TColors.primaryColor),
    ),
  );

  static IconButtonThemeData darkIconButtonTheme = const IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStatePropertyAll<Color>(TColors.light),
    ),
  );
}
