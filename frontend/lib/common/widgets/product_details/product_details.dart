import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/common/widgets/product_details/widgets/sections/harvest_button.dart';
import 'package:toprak_rehberi/common/widgets/product_details/widgets/sections/product_details_image.dart';
import 'package:toprak_rehberi/common/widgets/product_details/widgets/sections/product_details_planting_date.dart';
import 'package:toprak_rehberi/features/main_pages/products/widgets/product_card/product_progress.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

import '../../../dtos/ProductDTO.dart';

class TProductDetails extends StatelessWidget {
  final ProductDTO productDTO;

  const TProductDetails({super.key, required this.productDTO});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const TAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // Product Name
              Text(productDTO.productName ?? 'Unknown',
                  style: textTheme.headlineMedium),

              const SizedBox(height: TSizes.spaceBtwItems),

              // Product image
              TProductDetailsImage(productDTO: productDTO),

              const SizedBox(height: TSizes.spaceBtwItems),

              // Planting Date
              TProductDetailsPlantingDate(
                textTheme: textTheme,
                productDTO: productDTO,
              ),

              const SizedBox(height: TSizes.spaceBtwItems),

              // Land Info
              Container(
                height: 150,
                width: TSizes.cardWidth / 1.2,
                decoration: getCardDecoration(context),
                child: Column(
                  children: [
                    Text(productDTO.landName ?? 'Unknown'),
                    Text(productDTO.area?.toString() ?? 'Unknown')
                  ],
                ),
              ),

              const SizedBox(height: TSizes.spaceBtwItems),

              // Progress Bar
              TProductProgress(productDTO: productDTO),

              const SizedBox(height: TSizes.spaceBtwItems),

              THarvestButton(productDTO: productDTO),
            ],
          ),
        ),
      ),
    );
  }
}
