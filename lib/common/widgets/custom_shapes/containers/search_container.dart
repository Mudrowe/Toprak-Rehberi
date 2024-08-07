import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/device/device_utility.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.icon1 = Icons.search,
    this.icon2 = Icons.tune,
    this.showBackground = true,
    this.showBorder = true,
  });

  final String text;
  final IconData? icon1;
  final IconData? icon2;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.only(
          left: TSizes.spaceBtwItems, right: TSizes.spaceBtwItems),
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? TColors.dark
                    : TColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: TColors.grey) : null),
        child: Row(
          children: [
            Icon(
              icon1,
              color: TColors.primaryColor,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(text, style: Theme.of(context).textTheme.bodySmall),
            const Spacer(),
            Icon(icon2, color: TColors.primaryColor)
          ],
        ),
      ),
    );
  }
}
