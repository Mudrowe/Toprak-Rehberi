import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/common/widgets/product_details/product_details.dart';
import 'package:toprak_rehberi/features/main_pages/products/widgets/product_card/product_image.dart';
import 'package:toprak_rehberi/features/main_pages/products/widgets/product_card/product_progress.dart';
import 'package:toprak_rehberi/models/product.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

import '../../../../../dtos/ProductDTO.dart';

class TProductCard extends StatelessWidget {
  const TProductCard({
    super.key,
    required this.productDTO,
    this.showBackground = true,
    this.showBorder = true,
  });

  final ProductDTO productDTO;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => TProductDetails(productDTO: productDTO)),
      child: Container(
        width: TSizes.cardWidth,
        height: TSizes.cardHeight,
        decoration: getCardDecoration(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TProductCardImage(
              productDTO: productDTO,
              imagePath: productDTO.imageUrl!,
            ),
            TProductProgress(
              productDTO: productDTO,
            ),
          ],
        ),
      ),
    );
  }
}
