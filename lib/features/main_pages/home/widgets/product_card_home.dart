import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toprak_rehberi/common/styles/shadows.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/arc_progress_bar.dart';
import 'package:toprak_rehberi/features/main_pages/home/home.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/image_strings.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

class TProductCardHome extends StatelessWidget {
  const TProductCardHome({
    super.key,
    // TODO: Name can be too long and it breaks the card
    required this.productName,
    required this.harvestDate,
    required this.fieldName,
    required this.progressPercentage,
  });

  final String productName;
  final String harvestDate;
  final String fieldName;
  final double progressPercentage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const HomeScreen()),
      child: Container(
        width: TSizes.cardWidth,
        height: TSizes.cardHeight / 1.4,
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.productShadow],
          color: TColors.softGreen,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: (){}, icon: Image.asset(TImages.arrowBack)),
            Column(
              children: [
                const Text(
                  'İlerleme',
                  style: TextStyle(
                      color: TColors.black, fontWeight: FontWeight.bold),
                ),
                TArcProgressBar(progress: progressPercentage)
              ],
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                      color: TColors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  fieldName,
                  style: const TextStyle(
                      color: TColors.black, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Hasat Tarihi',
                  style: TextStyle(
                      color: TColors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  harvestDate,
                  style: const TextStyle(
                      color: TColors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            IconButton(onPressed: (){}, icon: Image.asset(TImages.arrowForward)),
            ],
        ),
      ),
    );
  }
}
