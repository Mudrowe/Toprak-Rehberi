import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/device/device_utility.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

class TProfileSection extends StatelessWidget {
  const TProfileSection({
    super.key,
    required this.title,
    required this.value,
    required this.onPressed,
    this.showBackground = true,
    this.showBorder = true,
  });

  final String title, value;
  final VoidCallback onPressed;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final Color textColor = dark ? TColors.light : TColors.dark;
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems / 1.5),
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
            border: showBorder ? Border.all(color: TColors.grey) : null,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: TColors.darkGrey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  value,
                  style: TextStyle(
                    color: textColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const Expanded(child: Icon(Icons.arrow_right_sharp)),
            ],
          ),
        ),
      ),
    );
  }
}
