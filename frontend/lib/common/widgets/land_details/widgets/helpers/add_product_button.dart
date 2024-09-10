import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toprak_rehberi/common/widgets/land_details/add_product_screen/add_product_screen.dart';
import 'package:toprak_rehberi/models/land.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

class TAddProductButton extends StatelessWidget {
  final Land land;

  const TAddProductButton({
    super.key,
    required this.land,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          TTexts.addProduct,
          style: TextStyle(
            fontSize: TSizes.fontSizeLg,
            fontWeight: FontWeight.w500,
          ),
        ),
        IconButton(
          iconSize: TSizes.iconLg,
          onPressed: () => Get.to(() => AddProductScreen(land: land)),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
