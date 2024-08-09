import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toprak_rehberi/common/styles/shadows.dart';
import 'package:toprak_rehberi/common/widgets/products/widgets/product_image.dart';
import 'package:toprak_rehberi/common/widgets/products/widgets/product_progress.dart';
import 'package:toprak_rehberi/features/main_pages/home/home.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';


// ? Card background is little bit weird in dark mode
// ? Should be more darker color but primary color is weird too
// ! Maybe it will be like the searchbox style

class TProductCard extends StatelessWidget {
  const TProductCard({
    super.key,
    // TODO: Name can be too long and it breaks the card
    required this.productName,
    required this.harvestDate,
    required this.fieldName,
    required this.imagePath,
    required this.progressPercentage,
    this.isHarvested = false,
    this.score = 3,
  });

  final String productName;
  final String harvestDate;
  final String fieldName;
  final String imagePath;
  final double progressPercentage;
  final bool isHarvested;
  final int score;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const HomeScreen()),
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
                productName: productName,
                imagePath: imagePath,
                fieldName: fieldName),
            TProductProgress(
                harvestDate: harvestDate,
                progressPercentage: progressPercentage,
                isHarvested: progressPercentage >= 1,
                score: score),
          ],
        ),
      ),
    );
  }
}
