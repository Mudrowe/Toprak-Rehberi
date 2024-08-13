import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/search_container.dart';
import 'package:toprak_rehberi/features/main_pages/products/widgets/product_card/product_card.dart';
import 'package:toprak_rehberi/features/main_pages/products/widgets/product_card/products_lists.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

class TPlantedProducts extends StatelessWidget {
  const TPlantedProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        const TSearchContainer(
          text: TTexts.searchProduct,
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        for (var product in plantedProductsList)
          Column(
            children: [
              TProductCard(product: product),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              )
            ],
          ),
      ],
    );
  }
}
