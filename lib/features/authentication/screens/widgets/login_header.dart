import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/image_strings.dart';
//import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //final dark = THelperFunctions.isDarkMode(context);

    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(TImages.appLogo),
        ),
      ],
    );
  }
}