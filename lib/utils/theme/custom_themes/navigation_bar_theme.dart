import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';

class TNavigationBarTheme {
  TNavigationBarTheme._();

  static NavigationBarThemeData navigationBarTheme =
      NavigationBarThemeData(
          indicatorColor: TColors.white,
          labelTextStyle:
              WidgetStateProperty.all(const TextStyle(color: TColors.white)),
          iconTheme: WidgetStateProperty.resolveWith((states) {
            return IconThemeData(
                color: states.contains(WidgetState.selected)
                    ? TColors.primaryColor
                    : TColors.white);
          }));
}
