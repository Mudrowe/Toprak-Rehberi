import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/dtos/ProductOptionDTO.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

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
            productOptionDTO.name,
            style: textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        // Product image
        Image.asset(
          productOptionDTO.imageUrl,
          height: TSizes.productImageHeight,
          width: TSizes.productImageWidth,
        ),

        // Land name

        Text(
          productDTO.land.name,
          style: textTheme.bodyLarge,
        ),
      ],
    );
  }
}
