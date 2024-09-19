import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/suggestions/widgets/helpers/suggestions_score.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

import '../../../../../../models/suggestion_product.dart';

class TSelectProductDropdownMenu extends StatelessWidget {
  final List<SuggestionProduct> suggestions;
  final ValueChanged<int?> onChanged;

  const TSelectProductDropdownMenu({
    super.key,
    required this.suggestions,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // Sort suggestions by score in descending order
    List<SuggestionProduct> sortedSuggestions = List.from(suggestions)
      ..sort((a, b) => b.score.compareTo(a.score));

    return DropdownButtonFormField(
      hint: Text(TTexts.choseProduct, style: textTheme.bodyLarge),
      items: [
        for (var product in sortedSuggestions)
          DropdownMenuItem(
            value: product.productOptionId,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.xxl),
                  child: Text(THelperFunctions.decodeUtf8(product.name)),
                ),
                TSuggestionsScore(suggestionProduct: product)
              ],
            ),
          ),
      ],
      onChanged: onChanged,
    );
  }
}
