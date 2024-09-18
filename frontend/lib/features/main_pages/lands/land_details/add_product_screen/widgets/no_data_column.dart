import 'package:flutter/material.dart';

import '../../../../../../utils/constants/sizes.dart';

Widget buildNoDataColumn(String title, int length, Color textColor) {
  return Column(
    children: [
      const Divider(
        indent: TSizes.dividerIndent,
        endIndent: TSizes.dividerIndent,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: TSizes.fontSizeMd,
            ),
          ),
          Text(
            '$length',
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: TSizes.fontSizeMd,
            ),
          ),
        ],
      ),
      const Divider(
        indent: TSizes.dividerIndent,
        endIndent: TSizes.dividerIndent,
      ),
      const SizedBox(height: TSizes.spaceBtwItems),
    ],
  );
}