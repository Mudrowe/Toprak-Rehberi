import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:toprak_rehberi/common/widgets/products/product_card.dart';
import 'package:toprak_rehberi/common/widgets/products/widgets/products_lists.dart';
import 'package:toprak_rehberi/utils/constants/image_strings.dart';
import 'package:toprak_rehberi/common/widgets/products/widgets/products_lists.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

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
          text: 'Ürün ara',
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
          )
      ],
    );
  }
}
