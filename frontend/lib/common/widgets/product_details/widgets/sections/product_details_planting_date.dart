import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

import '../../../../../dtos/ProductDTO.dart';

class TProductDetailsPlantingDate extends StatelessWidget {
  const TProductDetailsPlantingDate({
    super.key,
    required this.textTheme,
    required this.productDTO,
  });

  final TextTheme textTheme;
  final ProductDTO productDTO;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TSizes.cardHeight / 3,
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
            THelperFunctions.getFormattedDate(productDTO.plantingDate!),
            style: textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
