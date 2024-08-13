import 'package:flutter/material.dart';
import 'package:toprak_rehberi/models/land/land.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/enums.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

class TLandBanner extends StatelessWidget {
  const TLandBanner({
    super.key,
    required this.land,
  });

  final Land land;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        // Background
        Container(
          height: 45,
          width: TSizes.cardWidth,
          decoration: BoxDecoration(
            color: land.landType.color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(TSizes.cardRadiusLg),
              topRight: Radius.circular(TSizes.borderRadiusLg),
            ),
          ),
        ),

        // Text
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
              decoration: BoxDecoration(
                color: dark ? TColors.dark : TColors.light,
                borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
              ),
              child: Text(land.landType.displayName)),
        )
      ],
    );
  }
}
