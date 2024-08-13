import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

BoxDecoration getCardDecoration(BuildContext context,
    {bool showBackground = true, bool showBorder = true}) {
  final dark = THelperFunctions.isDarkMode(context);
  return BoxDecoration(
    color: showBackground
        ? dark
            ? TColors.dark
            : TColors.light
        : Colors.transparent,
    borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
    border: showBorder ? Border.all(color: TColors.grey) : null,
  );
}
