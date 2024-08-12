import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/arc_progress_bar.dart';
import 'package:toprak_rehberi/common/widgets/product_details/product_details.dart';
import 'package:toprak_rehberi/models/product/product.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

// ? Card background is little bit weird in dark mode
// ? Should be more darker color but primary color is weird too
// ! Maybe it will be like the searchbox style

// ? pieChartColor1 is too dark for dark mod. Consider to change it

class TProductCardHome extends StatelessWidget {
  const TProductCardHome({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => TProductDetails(product: product)),
      child: Container(
        width: TSizes.cardWidth,
        height: TSizes.cardHeight,
        decoration: BoxDecoration(
          // ! FIX: bottom part of the card's boxShadow is not visible
          //boxShadow: [TShadowStyle.productShadow],
          color: TColors.softGreen,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_left_sharp)),
            Column(
              children: [
                const Text(
                  'İlerleme',
                  style: TextStyle(
                      color: TColors.black, fontWeight: FontWeight.bold),
                ),
                TArcProgressBar(progress: product.progressPercentage)
              ],
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  product.productName,
                  style: const TextStyle(
                      color: TColors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  product.fieldName,
                  style: const TextStyle(
                      color: TColors.black, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Hasat Tarihi',
                  style: TextStyle(
                      color: TColors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  product.harvestDate,
                  style: const TextStyle(
                      color: TColors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_right_sharp)),
          ],
        ),
      ),
    );
  }
}
