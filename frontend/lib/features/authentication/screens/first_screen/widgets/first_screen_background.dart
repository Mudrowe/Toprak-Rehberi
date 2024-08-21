import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/image_strings.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

class TFirstScreenBackground extends StatelessWidget {
  const TFirstScreenBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        // Background
        Container(
          decoration: const BoxDecoration(
            gradient: TColors.linearGradient,
          ),
        ),
        // Logo and app name
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                TTexts.appName,
                style: TextStyle(
                    color: TColors.white,
                    fontSize: TSizes.lg,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                height: TSizes.logoHeight,
                width: TSizes.logoWidth,
                decoration: BoxDecoration(
                  color: dark ? TColors.black : TColors.white,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.sm),
                  child: Image(image: AssetImage(dark ? TImages.darkAppLogo : TImages.lightAppLogo)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
