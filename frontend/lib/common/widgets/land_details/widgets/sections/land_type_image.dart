import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/dtos/LandDTO.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

class TLandTypeImage extends StatelessWidget {
  const TLandTypeImage({
    super.key,
    required this.landDTO,
  });

  final LandDTO landDTO;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Type Image
        Container(
          height: TSizes.landCardHeight,
          width: TSizes.landCardWidth,
          decoration: getCardDecoration(context),
          child: Image.asset(THelperFunctions.decodeUtf8(landDTO.landTypeDTO.imageUrl)),
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
            child: Text(THelperFunctions.decodeUtf8(landDTO.landTypeDTO.name)),
          ),
        ),
      ],
    );
  }
}
