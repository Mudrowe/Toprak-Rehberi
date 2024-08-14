import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/custom_elevated_button.dart';
import 'package:toprak_rehberi/models/product/product.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

class THarvestButton extends StatelessWidget {
  final Product product;

  const THarvestButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return product.isHarvested
        ? const SizedBox()
        : CustomElevatedButton(
            onPressed: () {},
            text: TTexts.harvest,
            backgroundColor: TColors.primaryColor,
            textColor: TColors.white,
            width: TSizes.buttonWidth,
            height: TSizes.buttonHeight,
          );
  }
}
