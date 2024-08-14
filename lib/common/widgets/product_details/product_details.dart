import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/common/widgets/product_details/widgets/sections/harvest_button.dart';
import 'package:toprak_rehberi/common/widgets/product_details/widgets/sections/product_details_image.dart';
import 'package:toprak_rehberi/common/widgets/product_details/widgets/sections/product_details_planting_date.dart';
import 'package:toprak_rehberi/features/main_pages/products/widgets/product_card/product_progress.dart';
import 'package:toprak_rehberi/models/product/product.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

class TProductDetails extends StatelessWidget {
  final Product product;

  const TProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const TAppBar(),
      body: Center(
        child: Column(
          children: [
            Text(product.productName, style: textTheme.headlineMedium),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            // Product image
            TProductDetailsImage(product: product),

            const SizedBox(height: TSizes.spaceBtwItems),

            // Planting Date
            TProductDetailsPlantingDate(textTheme: textTheme, product: product),

            const SizedBox(height: TSizes.spaceBtwItems),

            // ! There should be TLandDetailsInfo in here
            // ! So, products must have land variable
            // Field Info
            Container(
              height: 150,
              width: TSizes.cardWidth / 1.2,
              decoration: getCardDecoration(context),
              child: Column(
                children: [
                  Text(product.landName),
                  Text(product.area.toString())
                ],
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            // Progress Bar
            TProductProgress(product: product),

            const SizedBox(height: TSizes.spaceBtwItems),

            THarvestButton(product: product),
            
          ],
        ),
      ),
    );
  }
}
