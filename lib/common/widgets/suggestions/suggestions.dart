import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/shadows.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/common/widgets/suggestions/seed/suggestions_list.dart';
import 'package:toprak_rehberi/common/widgets/suggestions/widgets/suggestion_card.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';
import 'package:toprak_rehberi/utils/device/device_utility.dart';

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
            Container(
              height: TSizes.suggestionHeadlineHeight,
              width: TDeviceUtils.getScreenWidth(context),
              decoration: BoxDecoration(
                gradient: TColors.recommendationGradient,
                boxShadow: [TShadowStyle.productShadow],
              ),
              child: const Center(
                child: Text(
                  TTexts.ourSuggestions,
                  style: TextStyle(
                      color: TColors.black,
                      fontSize: TSizes.fontSizeLg,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwSections),
            Padding(
              // ! Paddings will probably broke with different screen size
              padding: const EdgeInsets.only(left: TSizes.xxl*1.7, right: TSizes.xxl*1.2), 
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Ürün', style: textTheme.headlineSmall),
                  const Spacer(),
                  Text('Başarı Puanı', style: textTheme.headlineSmall),
                ],
              ),
            ),

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
