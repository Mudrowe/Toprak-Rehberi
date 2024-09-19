import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/dtos/ProductOptionDTO.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

import '../../../../../dtos/ProductDTO.dart';

class TProductCardImage extends StatelessWidget {
  const TProductCardImage({
    super.key,
    required this.productDTO,
  });

  final ProductDTO productDTO;

  @override
  Widget build(BuildContext context) {
    final ProductOptionDTO productOptionDTO = productDTO.productOptionDTO;

    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Product name
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: TSizes.xxs,
            horizontal: TSizes.md,
          ),
          decoration: getCardDecoration(context),
          child: Text(
            THelperFunctions.decodeUtf8(productOptionDTO.name),
            style: textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        // Product image
        Image.asset(
          THelperFunctions.decodeUtf8(productOptionDTO.imageUrl),
          height: TSizes.productImageHeight / 1.05,
          width: TSizes.productImageWidth,
        ),

        // Land name

        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              THelperFunctions.decodeUtf8(productDTO.land.name),
              style: textTheme.bodyLarge,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '${THelperFunctions.decodeUtf8(productDTO.area.toString())} ${TTexts.squareSymbol}',
              style: textTheme.bodyLarge,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
