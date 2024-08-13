import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/models/product/product.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

class TProductImage extends StatelessWidget {
  const TProductImage({
    super.key,
    required this.imagePath,
    required this.product,
  });

  final Product product;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
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
          child: Text(product.productName, style: textTheme.bodyLarge),
        ),

        // Product image
        Image.asset(
          imagePath,
          height: TSizes.productImageHeight,
          width: TSizes.productImageWidth,
        ),

        // Land name
        Text(
          product.landName,
          style: textTheme.bodyLarge
        )
      ],
    );
  }
}
