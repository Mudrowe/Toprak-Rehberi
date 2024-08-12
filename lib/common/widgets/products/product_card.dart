import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toprak_rehberi/common/styles/shadows.dart';
import 'package:toprak_rehberi/common/widgets/product_details/product_details.dart';
import 'package:toprak_rehberi/common/widgets/products/widgets/product_image.dart';
import 'package:toprak_rehberi/common/widgets/products/widgets/product_progress.dart';
import 'package:toprak_rehberi/models/product/product.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

// ? Card background is little bit weird in dark mode
// ? Should be more darker color but primary color is weird too
// ! Maybe it will be like the searchbox style

class TProductCard extends StatelessWidget {
  const TProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => TProductDetails(product: product)),
      child: Container(
        width: TSizes.cardWidth,
        height: TSizes.cardHeight,
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.productShadow],
          color: TColors.softGreen,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TProductImage(
                productName: product.productName,
                imagePath: product.imagePath,
                fieldName: product.fieldName),
            TProductProgress(
                harvestDate: product.harvestDate,
                progressPercentage: product.progressPercentage,
                isHarvested: product.progressPercentage >= 1,
                score: product.score),
          ],
        ),
      ),
    );
  }
}
