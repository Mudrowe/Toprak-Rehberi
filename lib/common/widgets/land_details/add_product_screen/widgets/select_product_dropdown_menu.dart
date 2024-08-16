import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/suggestions/seed/suggestions_list.dart';
import 'package:toprak_rehberi/common/widgets/suggestions/widgets/helpers/suggestions_score.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

class TSelectProductDropdownMenu extends StatelessWidget {
  const TSelectProductDropdownMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return DropdownButtonFormField(
      hint: Text(TTexts.choseProduct, style: textTheme.bodyLarge),
      items: [
        for (var product in suggesionsList)
          DropdownMenuItem(
            value: product.name,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.xxl),
                  child: Text(product.name),
                ),
                TSuggestionsScore(suggestionProduct: product)
              ],
            ),
          ),
      ],
      onChanged: (value) {},
    );
  }
}
