import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

class TScoringBar extends StatelessWidget {
  final String scorePath;
  final String scoreText;
  final Color scoreColor;
  final VoidCallback onTap;

  const TScoringBar({
    super.key,
    required this.scorePath,
    required this.scoreText,
    required this.scoreColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(scorePath),
          const SizedBox(height: TSizes.xs),
          Container(
            height: TSizes.scoreRectangleHeight,
            width: TSizes.scoreRectangleWidth,
            decoration: BoxDecoration(color: scoreColor),
          ),
          const SizedBox(height: TSizes.xs),
          Text(scoreText),
        ],
      ),
    );
  }
}
