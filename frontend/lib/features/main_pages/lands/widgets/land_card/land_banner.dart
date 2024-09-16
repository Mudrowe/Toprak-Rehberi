import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/dtos/LandDTO.dart';
import 'package:toprak_rehberi/utils/constants/enums.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';

class TLandBanner extends StatelessWidget {
  const TLandBanner({
    super.key,
    required this.landDTO,
  });

  final LandDTO landDTO;

  @override
  Widget build(BuildContext context) {
    LandType landType = landDTO.landTypeDTO.toLandType();
    return Stack(
      children: [
        // Background
        Container(
          height: TSizes.landBannerHeight,
          width: TSizes.cardWidth,
          decoration: BoxDecoration(
            color: landType.color,
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
            child: Text(THelperFunctions.decodeUtf8(landDTO.landTypeDTO.name)),
          ),
        ),
      ],
    );
  }
}
