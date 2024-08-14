import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

class TAddProductButton extends StatelessWidget {
  const TAddProductButton({
    super.key,
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
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
