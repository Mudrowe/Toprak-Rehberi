import 'package:flutter/material.dart';
import '../../../../common/widgets/custom_shapes/search_container.dart';
import '../../../../dtos/ProductDTO.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../widgets/product_card/product_card.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class TPlantedProducts extends StatelessWidget {
  final List<ProductDTO> products;

  const TPlantedProducts({
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
                'Ekili ürün yok',
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
                    const Text(TTexts.totalPlantedProducts),
                    Text('${products.length}'),
                  ],
                ),
                const Divider(
                  indent: TSizes.dividerIndent,
                  endIndent: TSizes.dividerIndent,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                for (var productDTO in products)
                  Column(
                    children: [
                      TProductCard(productDTO: productDTO),
                      const SizedBox(height: TSizes.spaceBtwItems),
                    ],
                  ),
              ],
            ),
          )
      ],
    );
  }
}
