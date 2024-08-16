import 'package:flutter/material.dart';
//import 'package:toprak_rehberi/utils/constants/colors.dart';
//import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

Future<void> selectDateRange({
  required BuildContext context,
  required String info,
}) {
  //final bool dark = THelperFunctions.isDarkMode(context);
  //final Color textColor = dark ? TColors.light : TColors.primaryColor;

  return showDateRangePicker(
    context: context,
    firstDate: DateTime(2020),
    lastDate: DateTime.now(),
    cancelText: 'İptal Et',
    confirmText: 'Onayla'
  );
}
