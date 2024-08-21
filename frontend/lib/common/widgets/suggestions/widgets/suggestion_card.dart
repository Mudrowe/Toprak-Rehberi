import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/common/widgets/suggestions/seed/suggestions_list.dart';
import 'package:toprak_rehberi/common/widgets/suggestions/widgets/helpers/suggestions_score.dart';
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
          // Product Name
          Padding(
            padding: const EdgeInsets.only(left: TSizes.xxl),
            child: Text(
              suggestionProduct.name,
              style: textTheme.titleLarge,
            ),
          ),
          const Spacer(),

          // Score
          TSuggestionsScore(suggestionProduct: suggestionProduct),
        ],
      ),
    );
  }
}
