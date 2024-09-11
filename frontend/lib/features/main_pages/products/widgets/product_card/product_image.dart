import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
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
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Product name
        if (productDTO.productName != null)
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: TSizes.xxs,
              horizontal: TSizes.md,
            ),
            decoration: getCardDecoration(context),
            child: Text(
              productDTO.productName!,
              style: textTheme.bodyLarge,
              overflow: TextOverflow.ellipsis,
            ),
          )
        else
          const Text('Product name not available'),

        // Product image
        if (productDTO.imageUrl != null)
          Image.asset(
            productDTO.imageUrl!,
            height: TSizes.productImageHeight,
            width: TSizes.productImageWidth,
          )
        else
          const Text('Image not available'),

        // Land name
        if (productDTO.landName != null)
          Text(
            productDTO.landName!,
            style: textTheme.bodyLarge,
          )
        else
          const Text('Land name not available'),
      ],
    );
  }
}
