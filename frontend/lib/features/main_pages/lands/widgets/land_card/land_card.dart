import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/dtos/LandDTO.dart';
import 'package:toprak_rehberi/features/main_pages/lands/widgets/land_card/land_banner.dart';
import 'package:toprak_rehberi/features/main_pages/lands/widgets/land_card/land_card_info.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

import '../../land_details/land_details.dart';

class TLandCard extends StatelessWidget {
  const TLandCard({
    super.key,
    required this.landDTO,
    this.showBackground = true,
    this.showBorder = true,
  });

  final LandDTO landDTO;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => TLandDetails(landDTO: landDTO)),
      child: Container(
        height: TSizes.cardHeight,
        width: TSizes.cardWidth,
        decoration: getCardDecoration(context),
        child: Column(
          children: [
            // Card Banner
            TLandBanner(landDTO: landDTO),

            const SizedBox(height: TSizes.spaceBtwItems),

            // Card Info
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Land Type Image
                  Image.asset(
                    THelperFunctions.decodeUtf8(landDTO.landTypeDTO.imageUrl),
                    height: TSizes.typeImageHeight,
                    width: TSizes.typeImageWidth,
                    fit: BoxFit.contain,
                  ),

                  // Land Info
                  TLandCardInfo(landDTO: landDTO),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
