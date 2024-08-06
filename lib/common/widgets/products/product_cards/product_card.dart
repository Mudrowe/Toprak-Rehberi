import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/image_strings.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

class TProductCard extends StatelessWidget {
  const TProductCard(
      {super.key,
      this.productName = 'Wheat',
      this.harvestDate = "11.04.2024",
      this.fieldName = "Arazi 1",
      this.imagePath = TImages.wheat});

  final String productName;
  final String harvestDate;
  final String fieldName;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: TColors.softGreen,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            height: 200,
            width: 50,
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  productName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              const Text(
                'Tahmini Hasat Tarihi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            harvestDate,
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            fieldName,
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
