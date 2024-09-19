import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/arc_progress_bar.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

import '../../../../dtos/ProductDTO.dart';
import '../../products/product_details/product_details.dart';

class TProductCardHome extends StatelessWidget {
  const TProductCardHome({
    super.key,
    required this.productDTO,
  });

  final ProductDTO productDTO;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => Get.to(() => TProductDetails(productDTO: productDTO)),
      child: Container(
        width: TSizes.cardWidth,
        height: TSizes.cardHeight,
        decoration: getCardDecoration(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(TTexts.progress, style: textTheme.bodyLarge),
                  TArcProgressBar(progress: productDTO.progressPercentage)
                ],
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Product Name
                  Text(
                    THelperFunctions.decodeUtf8(productDTO.productOptionDTO.name),
                    style: textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),

                  // Land Name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: Text(
                          THelperFunctions.decodeUtf8(productDTO.land.name),
                          style: textTheme.bodyMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '${THelperFunctions.decodeUtf8(productDTO.area!.toInt().toString())} ${TTexts.squareSymbol}',
                        style: textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),

                  // Harvest Date Title
                  Text(
                    TTexts.harvestDate,
                    style: textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),

                  // Harvest Date
                  Text(
                    THelperFunctions.getFormattedDate(productDTO.harvestDate!),
                    style: textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
