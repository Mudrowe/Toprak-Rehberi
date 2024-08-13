import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/common/widgets/product_details/product_details.dart';
import 'package:toprak_rehberi/features/main_pages/products/widgets/product_card/product_image.dart';
import 'package:toprak_rehberi/features/main_pages/products/widgets/product_card/product_progress.dart';
import 'package:toprak_rehberi/models/product/product.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

// ? Card background is little bit weird in dark mode
// ? Should be more darker color but primary color is weird too
// ! Maybe it will be like the searchbox style

class TProductCard extends StatelessWidget {
  const TProductCard({
    super.key,
    required this.product,
    this.showBackground = true,
    this.showBorder = true,
  });

  final Product product;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => TProductDetails(product: product)),
      child: Container(
        width: TSizes.cardWidth,
        height: TSizes.cardHeight,
        decoration: getCardDecoration(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TProductImage(
              product: product,
              imagePath: product.imagePath,
            ),
            TProductProgress(
              product: product,
            ),
          ],
        ),
      ),
    );
  }
}
