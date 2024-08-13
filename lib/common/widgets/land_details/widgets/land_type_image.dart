
import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/shadows.dart';
import 'package:toprak_rehberi/models/land/land.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/enums.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

class TLandTypeImage extends StatelessWidget {
  const TLandTypeImage({
    super.key,
    required this.land,
    required this.dark,
  });

  final Land land;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Type Image
        Container(
          height: TSizes.landCardHeight,
          width: TSizes.landCardWidth,
          decoration: BoxDecoration(
            color: TColors.backgroundGreen,
            borderRadius:
                BorderRadius.circular(TSizes.borderRadiusLg),
            boxShadow: [TShadowStyle.productShadow],
          ),
          child: Image.asset(land.landType.imagePath),
        ),
    
        // Type Text
        Padding(
          padding: const EdgeInsets.all(TSizes.smd),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: TSizes.xxs,
              horizontal: TSizes.md,
            ),
            decoration: BoxDecoration(
              color: dark ? TColors.dark : TColors.light,
              borderRadius:
                  BorderRadius.circular(TSizes.cardRadiusLg),
            ),
            child: Text(land.landType.displayName),
          ),
        ),
      ],
    );
  }
}
