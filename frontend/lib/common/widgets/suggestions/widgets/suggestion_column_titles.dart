import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

class TCardTitles extends StatelessWidget {
  const TCardTitles({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // ! Paddings will probably broke with different screen size
      padding: const EdgeInsets.only(
        left: TSizes.xxl * 1.7,
        right: TSizes.xxl * 1.2,
      ),
      child: Row(
        children: [
          // Product Name
          Text(TTexts.product, style: textTheme.headlineSmall),

          const Spacer(),

          // Score
          Text(TTexts.score, style: textTheme.headlineSmall),
        ],
      ),
    );
  }
}
