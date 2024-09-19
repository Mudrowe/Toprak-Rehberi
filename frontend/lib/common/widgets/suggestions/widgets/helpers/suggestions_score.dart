import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/arc_progress_bar.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

import '../../../../../models/suggestion_product.dart';

class TSuggestionsScore extends StatelessWidget {
  const TSuggestionsScore({
    super.key,
    required this.suggestionProduct,
  });

  final SuggestionProduct suggestionProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: TSizes.xxl),
      child: Container(
        height: TSizes.scoreTextBackgroundHeight,
        width: TSizes.scoreTextBackgroundWidth,
        decoration: BoxDecoration(
            color: getProgressColor(suggestionProduct.score / 100),
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg)),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: TSizes.xxs,
            horizontal: TSizes.md,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              '${suggestionProduct.score.toStringAsFixed(2)}%',
              style: const TextStyle(
                  color: TColors.black,
                  fontSize: TSizes.fontSizeMd,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
