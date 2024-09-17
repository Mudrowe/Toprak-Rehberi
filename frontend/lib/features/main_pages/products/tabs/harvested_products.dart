import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/search_container.dart';
import 'package:toprak_rehberi/features/main_pages/products/widgets/product_card/product_card.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

import '../../../../dtos/ProductDTO.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class THarvestedProducts extends StatelessWidget {
  final List<ProductDTO> products;

  const THarvestedProducts({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        const SizedBox(height: TSizes.spaceBtwItems),

        // Search bar
        const TSearchContainer(text: TTexts.searchProduct),

        const SizedBox(height: TSizes.spaceBtwSections),

        if (products.isEmpty)
          Column(
            children: [
              Image.asset(dark ? TImages.darkAppLogo : TImages.lightAppLogo),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Text(
                'Hasat edilmiş ürün yok',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )
        else
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(TTexts.totalHarvestedProducts),
                    Text('${products.length}'),
                  ],
                ),

                const Divider(
                  indent: TSizes.dividerIndent,
                  endIndent: TSizes.dividerIndent,
                ),

                const SizedBox(height: TSizes.spaceBtwItems),

                // Products list
                for (var productDTO in products)
                  Column(
                    children: [
                      TProductCard(productDTO: productDTO),
                      const SizedBox(height: TSizes.spaceBtwItems),
                    ],
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
