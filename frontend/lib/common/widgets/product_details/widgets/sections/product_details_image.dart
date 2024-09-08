import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

import '../../../../../dtos/ProductDTO.dart';

class TProductDetailsImage extends StatelessWidget {
  const TProductDetailsImage({
    super.key,
    required this.productDTO,
  });

  final ProductDTO productDTO;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TSizes.cardHeight / 1.2,
      width: TSizes.cardWidth / 1.2,
      padding: const EdgeInsets.all(TSizes.sm),
      decoration: getCardDecoration(context),
      child: FittedBox(
        fit: BoxFit.contain,
        child: productDTO.imageUrl != null && productDTO.imageUrl!.isNotEmpty
            ? Image.network(
                productDTO.imageUrl!, // Loading image from a URL
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error), // Fallback in case of an error
              )
            : const Icon(
                Icons.image_not_supported), // Placeholder if no image URL
      ),
    );
  }
}
