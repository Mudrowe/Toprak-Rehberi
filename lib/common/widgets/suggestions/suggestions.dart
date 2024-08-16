import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/common/widgets/suggestions/seed/suggestions_list.dart';
import 'package:toprak_rehberi/common/widgets/suggestions/widgets/suggestion_card.dart';
import 'package:toprak_rehberi/common/widgets/suggestions/widgets/suggestion_column_titles.dart';
import 'package:toprak_rehberi/common/widgets/suggestions/widgets/suggestion_sceen_header.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

class SuggestionsScreen extends StatelessWidget {
  const SuggestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const TAppBar(
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: TSizes.appBarHeight),

            // Headline
            const TSuggestionScreenHeader(),

            const SizedBox(height: TSizes.spaceBtwSections),

            // Card Titles
            TCardTitles(textTheme: textTheme),

            const SizedBox(height: TSizes.spaceBtwItems),

            // Suggestions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
              child: Column(children: [
                for (var suggestionProduct in suggesionsList)
                  Column(
                    children: [
                      TSuggestionCard(suggestionProduct: suggestionProduct),
                      const SizedBox(height: TSizes.spaceBtwItems)
                    ],
                  ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

