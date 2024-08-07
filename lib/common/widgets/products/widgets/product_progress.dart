import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/arc_progress_bar.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';

class TProductProgress extends StatelessWidget {
  const TProductProgress({
    super.key,
    required this.harvestDate,
    required this.progressPercentage,
  });

  final String harvestDate;
  final double progressPercentage;

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
    );
  }
}
