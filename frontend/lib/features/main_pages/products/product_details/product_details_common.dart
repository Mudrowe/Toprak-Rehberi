import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/dtos/ProductDTO.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

import '../../../../common/styles/card_style.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../lands/land_details/widgets/sections/land_details_column.dart';
import 'widgets/sections/product_details_image.dart';
import 'widgets/sections/product_details_planting_date.dart';

class ProductDetailsCommon extends StatelessWidget {
  final ProductDTO productDTO;
  final Widget? bottomWidget;

  const ProductDetailsCommon({
    Key? key,
    required this.productDTO,
    this.bottomWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        // Product Name
        Text(
          THelperFunctions.decodeUtf8(productDTO.productOptionDTO.name),
          style: textTheme.headlineMedium,
        ),

        const SizedBox(height: TSizes.spaceBtwItems),

        // Product image
        TProductDetailsImage(productDTO: productDTO),

        const SizedBox(height: TSizes.spaceBtwItems),

        // Planting Date
        TProductDetailsPlantingDate(
          textTheme: textTheme,
          productDTO: productDTO,
        ),

        const SizedBox(height: TSizes.spaceBtwItems),

        // Land Info
        Container(
          width: TSizes.cardWidth / 1.2,
          decoration: getCardDecoration(context),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              TSizes.xxl,
              TSizes.md,
              TSizes.xxl,
              TSizes.md,
            ),
            child: TLandDetailsColumn(
              landDTO: productDTO.land,
            ),
          ),
        ),

        const SizedBox(height: TSizes.spaceBtwItems),

        if (bottomWidget != null) bottomWidget!,
      ],
    );
  }
}
