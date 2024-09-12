import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toprak_rehberi/features/main_pages/products/widgets/product_card/product_card.dart';
import 'package:toprak_rehberi/models/land.dart';
import 'package:toprak_rehberi/utils/constants/image_strings.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

import '../../../../../dtos/ProductDTO.dart';
import '../../../../../service/fetching/pages/fetch_lands.dart';
import '../../../../../service/fetching/product/fetch_product.dart';

class TLandPlantedProducts extends StatelessWidget {
  final Land land;

  const TLandPlantedProducts({super.key, required this.land});

  Future<List<ProductDTO>> _fetchProducts() async {
    int landId = (await fetchLandByName(land.landName)).id!;
    List<ProductDTO> products = await fetchProductsByLandId(landId);

    for (var product in products) {
      product.productName = THelperFunctions.decodeUtf8(product.productName!);
    }

    return products;

  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return FutureBuilder<List<ProductDTO>>(
      future: _fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Column(
            children: [
              Image.asset(dark ? TImages.darkAppLogo : TImages.lightAppLogo),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Text(
                TTexts.noProducts,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          );
        } else {

          for (var product in snapshot.data!) {
            print('Sending ProductDTO JSON 1: ${jsonEncode(product.toJson())}');
          }
          return Column(
            children: [
              const Text(TTexts.plantedProducts),
              const SizedBox(height: TSizes.spaceBtwItems),
              for (var product in snapshot.data!)
                Column(
                  children: [
                    TProductCard(productDTO: product),
                    const SizedBox(height: TSizes.spaceBtwItems),
                  ],
                ),
            ],
          );
        }
      },
    );
  }
}
