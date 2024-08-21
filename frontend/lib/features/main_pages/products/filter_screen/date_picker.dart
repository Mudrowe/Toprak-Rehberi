import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/theme/custom_themes/date_range_picker_theme.dart';

//import 'package:toprak_rehberi/utils/constants/colors.dart';
//import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

Future<void> selectDateRange({
  required BuildContext context,
  required String info,
}) {
  final ThemeData dateRangePickerTheme = Theme.of(context).brightness == Brightness.dark
      ? TDateRangePickerTheme.darkDateRangePickerTheme
      : TDateRangePickerTheme.lightDateRangePickerTheme;


  return showDateRangePicker(
    context: context,
    firstDate: DateTime(2020),
    lastDate: DateTime.now(),
    cancelText: 'İptal Et',
    confirmText: 'Onayla',
    locale: const Locale('tr'),
    builder: (context, child) {
      return Theme(
        data: dateRangePickerTheme, // Apply the selected theme
        child: child!,
      );
    },
  );
}
