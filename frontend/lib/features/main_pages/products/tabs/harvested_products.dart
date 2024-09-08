import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/search_container.dart';
import 'package:toprak_rehberi/features/main_pages/products/widgets/product_card/product_card.dart';
import 'package:toprak_rehberi/models/product/product.dart'; // Ensure correct import for the Product model
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../dtos/ProductDTO.dart';
import '../../../../service/fetchings/pages/fetch_products.dart';

class THarvestedProducts extends StatelessWidget {
  const THarvestedProducts({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: TSizes.spaceBtwItems),

        // Search bar
        const TSearchContainer(text: TTexts.searchProduct),

        const SizedBox(height: TSizes.spaceBtwSections),

        // Use FutureBuilder to dynamically fetch and display harvested products
        FutureBuilder<List<ProductDTO>>(
          future: fetchHarvestedProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Show a loading indicator while fetching
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}'); // Show error if any
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No harvested products available');
            } else {
              // Display the total number of harvested products
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(TTexts.totalHarvestedProducts),
                      Text('${snapshot.data!.length}')
                    ],
                  ),

                  const Divider(
                    indent: TSizes.dividerIndent,
                    endIndent: TSizes.dividerIndent,
                  ),

                  const SizedBox(height: TSizes.spaceBtwItems),

                  // Products list
                  for (var productDTO in snapshot.data!)
                    Column(
                      children: [
                        TProductCard(productDTO: productDTO),
                        const SizedBox(height: TSizes.spaceBtwItems),
                      ],
                    ),
                ],
              );
            }
          },
        ),
      ],
    );
  }
}
