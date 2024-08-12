import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/shadows.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/custom_elevated_button.dart';
import 'package:toprak_rehberi/common/widgets/products/widgets/product_progress.dart';
import 'package:toprak_rehberi/models/product/product.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
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
            Container(
              height: TSizes.cardHeight / 1.2,
              width: TSizes.cardWidth / 1.2,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: TColors.softGreen,
                borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
                boxShadow: [TShadowStyle.productShadow],
              ),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.asset(product.imagePath),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            // Planting Date
            Container(
              height: TSizes.cardHeight / 2.5,
              width: TSizes.cardWidth / 1.2,
              decoration: BoxDecoration(
                color: TColors.softGreen,
                borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
                boxShadow: [TShadowStyle.productShadow],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ekim Tarihi',
                    style: textTheme.headlineSmall,
                  ),
                  Text(
                    product.plantingDate,
                    style: textTheme.headlineSmall,
                  ),
                ],
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            // Field Info
            Container(
              height: 150,
              width: TSizes.cardWidth / 1.2,
              decoration: BoxDecoration(
                color: TColors.softGreen,
                borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
                boxShadow: [TShadowStyle.productShadow],
              ),
              child: Column(
                children: [
                  Text(product.fieldName),
                  Text(product.area.toString())
                ],
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            // Progress Bar
            TProductProgress(
              harvestDate: product.harvestDate,
              progressPercentage: product.progressPercentage,
              isHarvested: product.progressPercentage >= 1,
              score: product.score,
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            // Harvest Button
            product.isHarvested
                ? const SizedBox()
                : CustomElevatedButton(
                    onPressed: () {},
                    text: 'HASAT ET',
                    backgroundColor: TColors.primaryColor,
                    textColor: TColors.white,
                    width: TSizes.buttonWidth,
                    height: TSizes.buttonHeight,
                  )
          ],
        ),
      ),
    );
  }
}
