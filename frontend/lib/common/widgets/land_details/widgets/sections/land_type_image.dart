import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/models/land.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

class TLandTypeImage extends StatelessWidget {
  const TLandTypeImage({
    super.key,
    required this.land,
  });

  final Land land;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Type Image
        Container(
          height: TSizes.landCardHeight,
          width: TSizes.landCardWidth,
          decoration: getCardDecoration(context),
          child: Image.asset(land.landType.imageUrl),
        ),

        // Type Text
        Padding(
          padding: const EdgeInsets.all(TSizes.smd),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: TSizes.xxs,
              horizontal: TSizes.md,
            ),
            decoration: getCardDecoration(context),
            child: Text(land.landType.name),
          ),
        ),
      ],
    );
  }
}
