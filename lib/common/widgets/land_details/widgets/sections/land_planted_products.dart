import 'package:flutter/material.dart';
import 'package:toprak_rehberi/features/main_pages/products/widgets/product_card/product_card.dart';
import 'package:toprak_rehberi/models/land/land.dart';
import 'package:toprak_rehberi/utils/constants/image_strings.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

class TLandPlantedProducts extends StatelessWidget {
  final Land land;

  const TLandPlantedProducts({super.key, required this.land});

  @override
  Widget build(BuildContext context) {
    return land.isPlanted
        ? Column(
            children: [
              const Text(TTexts.plantedProducts),
              const SizedBox(height: TSizes.spaceBtwItems),
              for (var product in land.plantedProducts!)
                Column(
                  children: [
                    TProductCard(product: product),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    )
                  ],
                ),
            ],
          )
        : Column(
            children: [
              Image.asset(TImages.appLogo),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const Text(
                TTexts.noPorducts,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          );
  }
}
