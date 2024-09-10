import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/arc_progress_bar.dart';
import 'package:toprak_rehberi/common/widgets/product_details/product_details.dart';
import 'package:toprak_rehberi/models/product.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

import '../../../../dtos/ProductDTO.dart';

// ? pieChartColor1 is too dark for dark mod. Consider to change it

// ! IconButton theme breaks the left-right arrows in the TProductCardHome.

class TProductCardHome extends StatelessWidget {
  const TProductCardHome({
    super.key,
    required this.productDTO,
  });

  final ProductDTO productDTO;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => Get.to(() => TProductDetails(productDTO: productDTO)),
      child: Container(
        width: TSizes.cardWidth,
        height: TSizes.cardHeight,
        decoration: getCardDecoration(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // ! IconButton theme breaks the left-right arrows in the TProductCardHome.
            //IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_left_sharp)),
            Column(
              children: [
                Text(TTexts.progress, style: textTheme.bodyLarge),
                TArcProgressBar(progress: productDTO.progressPercentage)
              ],
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Product Name
                Text(
                  productDTO.productName!,
                  style: textTheme.bodyMedium,
                ),

                // Land Name
                Text(
                  productDTO.landName,
                  style: textTheme.bodyMedium,
                ),

                // Harvest Date Title
                Text(
                  TTexts.harvestDate,
                  style: textTheme.bodyMedium,
                ),

                // Harvest Date
                Text(
                  productDTO.harvestDate!.toIso8601String(),
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
            // ! IconButton theme breaks the left-right arrows in the TProductCardHome.
            //IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_right_sharp)),
          ],
        ),
      ),
    );
  }
}
