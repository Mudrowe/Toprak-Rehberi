import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/search_container.dart';
import 'package:toprak_rehberi/features/main_pages/products/widgets/product_card/product_card.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

import '../../../../dtos/ProductDTO.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class THarvestedProducts extends StatefulWidget {
  final List<ProductDTO> products;

  const THarvestedProducts({
    super.key,
    required this.products,
  });

  @override
  _THarvestedProductsState createState() => _THarvestedProductsState();
}

class _THarvestedProductsState extends State<THarvestedProducts> {
  late List<ProductDTO> filteredProducts;

  @override
  void initState() {
    super.initState();
    filteredProducts = widget.products;
  }

  void _onSearchChanged(String query) {
    setState(() {
      filteredProducts = widget.products
          .where((product) => product.productOptionDTO.name
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        const SizedBox(height: TSizes.spaceBtwItems),
        TSearchContainer(
          onSearchChanged: _onSearchChanged,
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        if (filteredProducts.isEmpty)
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
                    Text('${filteredProducts.length}'),
                  ],
                ),

                const Divider(
                  indent: TSizes.dividerIndent,
                  endIndent: TSizes.dividerIndent,
                ),

                const SizedBox(height: TSizes.spaceBtwItems),

                // Products list
                for (var productDTO in filteredProducts)
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
