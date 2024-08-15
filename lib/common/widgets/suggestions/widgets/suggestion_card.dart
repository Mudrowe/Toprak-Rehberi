import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/arc_progress_bar.dart';
import 'package:toprak_rehberi/common/widgets/suggestions/seed/suggestions_list.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

class TSuggestionCard extends StatelessWidget {
  final SuggestionProduct suggestionProduct;

  const TSuggestionCard({
    super.key,
    required this.suggestionProduct,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
        height: TSizes.suggestionCardHeight,
        width: double.infinity,
        decoration: getCardDecoration(context),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: TSizes.xxl),
              child: Text(
                suggestionProduct.name,
                style: textTheme.titleLarge,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: TSizes.xxl),
              child: Container(
                decoration: BoxDecoration(
                    color: getProgressColor(suggestionProduct.score / 100),
                    borderRadius: BorderRadius.circular(TSizes.cardRadiusLg)),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: TSizes.xxs,
                    horizontal: TSizes.md,
                  ),
                  child: Text(
                    '${suggestionProduct.score.toString()}%',
                    style: textTheme.bodyLarge,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
