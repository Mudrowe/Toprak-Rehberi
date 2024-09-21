import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/models/suggestion_product.dart';

import '../../../common/widgets/suggestions/widgets/suggestion_card.dart';
import '../../../common/widgets/suggestions/widgets/suggestion_column_titles.dart';
import '../../../common/widgets/suggestions/widgets/suggestion_screen_header.dart';
import '../../../utils/constants/sizes.dart';

class ToprakRehberiResult extends StatelessWidget {
  final List<SuggestionProduct> suggestionsList;

  const ToprakRehberiResult({super.key, required this.suggestionsList});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    List<SuggestionProduct> suggestionsListSorted = suggestionsList..sort((a, b) => b.score.compareTo(a.score));

    return Scaffold(
      appBar: const TAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: TSizes.appBarHeight),

            // Headline
            const TSuggestionScreenHeader(suggestionsText: 'Bu bölge için önerdiklerimiz',),

            const SizedBox(height: TSizes.spaceBtwSections),

            // Card Titles
            TCardTitles(textTheme: textTheme),

            const SizedBox(height: TSizes.spaceBtwItems),

            // Suggestions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
              child: Column(
                children: [
                  for (var suggestionProduct in suggestionsListSorted)
                    Column(
                      children: [
                        TSuggestionCard(suggestionProduct: suggestionProduct),
                        const SizedBox(height: TSizes.spaceBtwItems),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
