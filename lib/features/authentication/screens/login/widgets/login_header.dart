import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/image_strings.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';
//import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: TSizes.logoHeight,
          width: TSizes.logoWidth,
          decoration: BoxDecoration(
            color: dark ? TColors.black : TColors.white,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(TSizes.sm),
            child: Image(
                image: AssetImage(
                    dark ? TImages.darkAppLogo : TImages.lightAppLogo)),
          ),
        ),
      ],
    );
  }
}
