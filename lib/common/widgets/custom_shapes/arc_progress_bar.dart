import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

// TODO: PROGRESS BAR SHOULD BE ARC, NOT CIRCLE

class TArcProgressBar extends StatelessWidget {
  final double progress; // Value between 0.0 and 1.0

  const TArcProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    Color progressColor = getProgressColor(progress);

    return CircularPercentIndicator(
      radius: TSizes.pieChartRadius,
      lineWidth: TSizes.md,
      percent: progress,
      center: Text(
        "${(progress * 100).toStringAsFixed(2)}%",
        style: textTheme.bodyMedium
      ),
      progressColor: progressColor,
      backgroundColor: TColors.progressBackground,
      circularStrokeCap: CircularStrokeCap.round,
      startAngle: 0,
    );
  }
}

Color getProgressColor(double progress) {
  if (progress <= 0.2) {
    return Color.lerp(TColors.bad, TColors.meh, progress / 0.2)!;
  } else if (progress <= 0.4) {
    return Color.lerp(TColors.meh, TColors.mid, (progress - 0.2) / 0.2)!;
  } else if (progress <= 0.6) {
    return Color.lerp(TColors.mid, TColors.good, (progress - 0.4) / 0.2)!;
  } else if (progress <= 0.8) {
    return Color.lerp(TColors.good, TColors.veryGood, (progress - 0.6) / 0.2)!;
  } else {
    return Color.lerp(TColors.good, TColors.veryGood, (progress - 0.8) / 0.2)!;
  }
}
