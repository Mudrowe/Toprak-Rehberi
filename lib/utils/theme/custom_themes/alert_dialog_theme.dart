import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';

class TAlertDialogTheme {
  TAlertDialogTheme._();

  static const lightAlertDialogTheme = DialogTheme(
    backgroundColor: TColors.light,
  );


  static const darkAlertDialogTheme = DialogTheme(
    backgroundColor: TColors.dark,
  );
}