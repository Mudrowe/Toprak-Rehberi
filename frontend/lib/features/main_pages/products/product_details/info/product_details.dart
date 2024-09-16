import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/features/main_pages/products/product_details/info/product_details_common.dart';
import 'package:toprak_rehberi/features/main_pages/products/widgets/product_card/product_progress.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/dtos/ProductDTO.dart';

import '../widgets/sections/harvest_button.dart';


class TProductDetails extends StatefulWidget {
  final ProductDTO productDTO;

  const TProductDetails({super.key, required this.productDTO});

  @override
  _TProductDetailsState createState() => _TProductDetailsState();
}

class _TProductDetailsState extends State<TProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: ProductDetailsCommon(
            productDTO: widget.productDTO,
            bottomWidget: Column(
              children: [
                TProductProgress(productDTO: widget.productDTO),
                const SizedBox(height: TSizes.spaceBtwItems),
                THarvestButton(productDTO: widget.productDTO),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
