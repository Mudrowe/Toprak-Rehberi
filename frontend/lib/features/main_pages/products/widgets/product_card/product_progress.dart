import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/arc_progress_bar.dart';
import 'package:toprak_rehberi/features/main_pages/products/widgets/helpers/score_display.dart';
import 'package:toprak_rehberi/models/product/product.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

class TProductProgress extends StatelessWidget {
  const TProductProgress({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        // Harvest Date
        children: [
          Text(
            product.isHarvested
                ? TTexts.harvestDate
                : TTexts.estimatedHarvestDate,
            style: textTheme.bodyLarge
          ),
          Text(
            product.harvestDate,
            style: textTheme.bodyMedium
          ),

          // Progress Bar
          if (product.isHarvested) ...[
            const SizedBox(height: TSizes.sm), // Spacing
            TScoreDisplay(score: product.score)
          ] else ...[
            Text(
              TTexts.progress,
              style: textTheme.bodyMedium
            ),
            TArcProgressBar(
              progress: product.progressPercentage,
            ),
          ],
        ]);
  }
}
