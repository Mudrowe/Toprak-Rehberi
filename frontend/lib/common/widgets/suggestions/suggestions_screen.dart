import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/common/widgets/suggestions/widgets/suggestion_card.dart';
import 'package:toprak_rehberi/common/widgets/suggestions/widgets/suggestion_column_titles.dart';
import 'package:toprak_rehberi/common/widgets/suggestions/widgets/suggestion_sceen_header.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

import '../../../models/suggestion_product.dart';
import '../../../service/suggestion/suggestion.dart';

class SuggestionsScreen extends StatelessWidget {
  final int landId;

  const SuggestionsScreen({super.key, required this.landId});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const TAppBar(
        showBackButton: true,
      ),
      body: FutureBuilder<List<SuggestionProduct>>(
        future: fetchSuggestions(landId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No suggestions available.'));
          } else {
            // Sort suggestions by score in descending order
            final suggestionsList = snapshot.data!
              ..sort((a, b) => b.score.compareTo(a.score));
            return SingleChildScrollView(
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
                    child: Column(
                      children: [
                        for (var suggestionProduct in suggestionsList)
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
            );
          }
        },
      ),
    );
  }
}
