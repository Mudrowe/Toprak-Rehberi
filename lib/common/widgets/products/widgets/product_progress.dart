import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/arc_progress_bar.dart';
import 'package:toprak_rehberi/features/main_pages/products/widgets/score_display.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';

class TProductProgress extends StatelessWidget {
  const TProductProgress({
    super.key,
    required this.harvestDate,
    required this.progressPercentage,
    required this.isHarvested,
    required this.score,
  });

  final String harvestDate;
  final double progressPercentage;
  final bool isHarvested;
  final int score;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text( 
            'Tahmini Hasat Tarihi',
            style: TextStyle(
              color: TColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            harvestDate,
            style: const TextStyle(
              color: TColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (isHarvested) ...[
            const SizedBox(height: 8), // Spacing
            TScoreDisplay(score: score)
          ] else ...[
            const Text(
              'İlerleme',
              style: TextStyle(
                color: TColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TArcProgressBar(
              progress: progressPercentage,
            ),
          ],
        ]);
  }
}
