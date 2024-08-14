import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

class LegendItem extends StatelessWidget {
  final Color color;
  final String productName;
  final String percentage;

  const LegendItem(
      {super.key,
      required this.color,
      required this.productName,
      required this.percentage});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final Color textColor = dark ? TColors.white : TColors.black;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.sm),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            width: 10,
            height: 10,
          ),
          const SizedBox(width: 8),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              productName,
              style: const TextStyle(
                  color: TColors.darkGrey, fontWeight: FontWeight.bold),
            ),
            Text(percentage,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ]),
        ],
      ),
    );
  }
}
