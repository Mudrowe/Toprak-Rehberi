import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/shadows.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';
import 'package:toprak_rehberi/utils/device/device_utility.dart';

class TSuggestionScreenHeader extends StatelessWidget {
  final String suggestionsText;

  const TSuggestionScreenHeader({
    super.key,
    required this.suggestionsText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TSizes.suggestionHeadlineHeight,
      width: TDeviceUtils.getScreenWidth(context),
      decoration: BoxDecoration(
        gradient: TColors.recommendationGradient,
        boxShadow: [TShadowStyle.productShadow],
      ),
      child: const Center(
        child: Text(
          TTexts.ourSuggestions,
          style: TextStyle(
              color: TColors.black,
              fontSize: TSizes.fontSizeLg,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
