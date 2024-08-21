import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/models/product/product.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

class TProductDetailsPlantingDate extends StatelessWidget {
  const TProductDetailsPlantingDate({
    super.key,
    required this.textTheme,
    required this.product,
  });

  final TextTheme textTheme;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TSizes.cardHeight / 2.5,
      width: TSizes.cardWidth / 1.2,
      decoration: getCardDecoration(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            TTexts.plantingDate,
            style: textTheme.headlineSmall,
          ),
          Text(
            product.plantingDate,
            style: textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
