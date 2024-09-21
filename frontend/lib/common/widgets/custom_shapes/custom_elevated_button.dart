import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

import '../../../utils/constants/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final Gradient? backgroundGradient;
  final Color textColor;
  final double width;
  final double height;
  final bool isShimmer;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.backgroundGradient,
    required this.textColor,
    this.width = TSizes.buttonWidth,
    this.height = TSizes.buttonHeight,
    this.isShimmer = false, // Default is false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundGradient == null ? backgroundColor : null,
        gradient: backgroundGradient,
        borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width, height),
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
          ),
        ),
        child: isShimmer
            ? Shimmer.fromColors(
                baseColor: TColors.dark,
                highlightColor: Colors.red,
                period: const Duration(seconds: 3),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: TSizes.fontSizeLg,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              )
            : Text(
                text,
                style: TextStyle(color: textColor),
              ),
      ),
    );
  }
}
