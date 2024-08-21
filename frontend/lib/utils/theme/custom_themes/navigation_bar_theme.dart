import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';

class TNavigationBarTheme {
  TNavigationBarTheme._();

  static final NavigationBarThemeData lightNavigationBarTheme =
      NavigationBarThemeData(
    indicatorColor: TColors.white,
    backgroundColor: TColors.primaryColor,
    labelTextStyle:
        WidgetStateProperty.all(const TextStyle(color: TColors.white)),
    iconTheme: WidgetStateProperty.resolveWith(
      (states) {
        return IconThemeData(
            color: states.contains(WidgetState.selected)
                ? TColors.primaryColor
                : TColors.white);
      },
    ),
  );

  static final NavigationBarThemeData darkNavigationBarTheme =
      NavigationBarThemeData(
    indicatorColor: TColors.grey,
    backgroundColor: TColors.dark,
    labelTextStyle:
        WidgetStateProperty.all(const TextStyle(color: TColors.grey)),
    iconTheme: WidgetStateProperty.resolveWith(
      (states) {
        return IconThemeData(
            color: states.contains(WidgetState.selected)
                ? TColors.dark
                : TColors.grey);
      },
    ),
  );
}
