import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/custom_elevated_button.dart';
import 'package:toprak_rehberi/features/main_pages/products/widgets/product_card/product_progress.dart';
import 'package:toprak_rehberi/models/product/product.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

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
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: getCardDecoration(context),
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
              decoration: getCardDecoration(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    TTexts.plantingDate,
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
            TProductProgress(
              product: product,
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            // Harvest Button
            product.isHarvested
                ? const SizedBox()
                : CustomElevatedButton(
                    onPressed: () {},
                    text: TTexts.harvest,
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
