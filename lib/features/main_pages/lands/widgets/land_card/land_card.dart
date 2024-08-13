import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toprak_rehberi/common/styles/shadows.dart';
import 'package:toprak_rehberi/common/widgets/land_details/land_details.dart';
import 'package:toprak_rehberi/features/main_pages/lands/widgets/land_card/land_banner.dart';
import 'package:toprak_rehberi/features/main_pages/lands/widgets/land_card/land_info.dart';
import 'package:toprak_rehberi/models/land/land.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/enums.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

// TODO Write a generic text color

class TLandCard extends StatelessWidget {
  const TLandCard({super.key, required this.land});

  final Land land;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => TLandDetails(land: land)),
      child: Container(
        height: TSizes.cardHeight,
        width: TSizes.cardWidth,
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.productShadow],
          color: TColors.softGreen,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
        ),
        child: Column(
          children: [
            // Card Banner
            TLandBanner(land: land),

            const SizedBox(height: TSizes.spaceBtwItems),

            // Card Info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Land Type Image
                Image.asset(
                  land.landType.imagePath,
                  height: TSizes.typeImageHeight,
                  width: TSizes.typeImageWidth,
                ),

                // Land Info
                TLandInfo(land: land),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
