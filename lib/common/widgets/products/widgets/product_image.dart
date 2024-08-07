import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

class TProductImage extends StatelessWidget {
  const TProductImage({
    super.key,
    required this.productName,
    required this.imagePath,
    required this.fieldName,
  });

  final String productName;
  final String imagePath;
  final String fieldName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
          decoration: BoxDecoration(
              color: TColors.white,
              borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
              boxShadow: [
                BoxShadow(
                  color: TColors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                )
              ]),
          child: Text(
            productName,
            style: const TextStyle(
              color: TColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Image.asset(
          imagePath,
          height: 112,
          width: 100,
        ),
        Text(
          fieldName,
          style: const TextStyle(
            color: TColors.black,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
