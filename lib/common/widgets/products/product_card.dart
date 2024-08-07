import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toprak_rehberi/common/styles/shadows.dart';
import 'package:toprak_rehberi/common/widgets/products/widgets/product_image.dart';
import 'package:toprak_rehberi/common/widgets/products/widgets/product_progress.dart';
import 'package:toprak_rehberi/features/main_pages/home/home.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

class TProductCard extends StatelessWidget {
  const TProductCard({
    super.key,
    // TODO: Name can be too long and it breaks the card
    required this.productName,
    required this.harvestDate,
    required this.fieldName,
    required this.imagePath,
    required this.progressPercentage,
  });

  final String productName;
  final String harvestDate;
  final String fieldName;
  final String imagePath;
  final double progressPercentage;

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
                harvestDate: harvestDate, progressPercentage: progressPercentage),
          ],
        ),
      ),
    );
  }
}
