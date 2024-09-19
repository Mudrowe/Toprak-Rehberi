import 'package:flutter/material.dart';
import 'package:toprak_rehberi/dtos/LandDTO.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

import '../../add_product_screen/add_product_screen.dart';

class TAddProductButton extends StatelessWidget {
  final LandDTO landDTO;

  const TAddProductButton({
    super.key,
    required this.landDTO,
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
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddProductScreen(landDTO: landDTO),
            ),
          ),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
