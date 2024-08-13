import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/shadows.dart';
import 'package:toprak_rehberi/features/main_pages/lands/widgets/land_banner.dart';
import 'package:toprak_rehberi/models/land/land.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

// TODO Write a generic text color

class TLandCard extends StatelessWidget {
  const TLandCard({super.key, required this.land});

  final Land land;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: TSizes.cardWidth,
        height: TSizes.cardHeight,
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.productShadow],
          color: TColors.softGreen,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
        ),
        child: Column(
          children: [
            TLandBanner(land: land),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 18),
                  child: Column(
                    children: [
                      Text(
                        land.landName,
                        style: const TextStyle(color: TColors.dark),
                      ),
                      Text(
                        '${land.adres.city}  ${land.adres.district}',
                        style: const TextStyle(color: TColors.dark),
                      ),
                      Text(
                        '${land.area.toInt()} ${TTexts.squareSymbol}',
                        style: const TextStyle(color: TColors.dark),
                      ),
                    ],
                  ),
                ),
                //const SizedBox(width: TSizes.spaceBtwSections),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Row(
                    children: [
                      const Text(
                        TTexts.isPlanted,
                        style: TextStyle(color: TColors.dark),
                      ),
                      Checkbox(value: land.isPlanted, onChanged: (value) {}),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
