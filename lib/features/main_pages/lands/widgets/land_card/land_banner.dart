import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/models/land/land.dart';
import 'package:toprak_rehberi/utils/constants/enums.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

class TLandBanner extends StatelessWidget {
  const TLandBanner({
    super.key,
    required this.land,
  });

  final Land land;

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(TSizes.smd),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: TSizes.xxs,
              horizontal: TSizes.md,
            ),
            decoration: getCardDecoration(context),
            child: Text(land.landType.displayName),
          ),
        ),
      ],
    );
  }
}
