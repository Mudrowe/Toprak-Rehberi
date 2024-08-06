import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/image_strings.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

class TFirstScreenBackground extends StatelessWidget {
  const TFirstScreenBackground({super.key});

  @override
  Widget build(BuildContext context) {
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
                height: 120,
                width: 120,
                decoration: const BoxDecoration(
                  color: TColors.white,
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image(image: AssetImage(TImages.appLogo)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
