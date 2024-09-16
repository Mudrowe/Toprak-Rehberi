import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/common/widgets/product_details/widgets/sections/harvest_button.dart';
import 'package:toprak_rehberi/common/widgets/product_details/widgets/sections/product_details_image.dart';
import 'package:toprak_rehberi/common/widgets/product_details/widgets/sections/product_details_planting_date.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/dtos/ProductDTO.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

import '../../../features/main_pages/products/widgets/product_card/product_progress.dart';
import '../../styles/card_style.dart';
import '../land_details/widgets/sections/land_details_column.dart';

class TProductDetails extends StatefulWidget {
  final ProductDTO productDTO;

  const TProductDetails({super.key, required this.productDTO});

  @override
  _TProductDetailsState createState() => _TProductDetailsState();
}

class _TProductDetailsState extends State<TProductDetails> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const TAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // Product Name
              Text(
                THelperFunctions.decodeUtf8(widget.productDTO.productOptionDTO.name ?? 'Unknown'),
                style: textTheme.headlineMedium,
              ),

              const SizedBox(height: TSizes.spaceBtwItems),

              // Product image
              TProductDetailsImage(productDTO: widget.productDTO),

              const SizedBox(height: TSizes.spaceBtwItems),

              // Planting Date
              TProductDetailsPlantingDate(
                textTheme: textTheme,
                productDTO: widget.productDTO,
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
                    landDTO: widget.productDTO.land,
                  ),
                ),
              ),

              const SizedBox(height: TSizes.spaceBtwItems),

              // Progress Bar
              TProductProgress(productDTO: widget.productDTO),

              const SizedBox(height: TSizes.spaceBtwItems),

              THarvestButton(productDTO: widget.productDTO),
            ],
          ),
        ),
      ),
    );
  }
}
