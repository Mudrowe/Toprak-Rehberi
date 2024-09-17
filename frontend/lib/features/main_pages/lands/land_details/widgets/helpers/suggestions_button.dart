import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/custom_elevated_button.dart';
import 'package:toprak_rehberi/common/widgets/suggestions/suggestions.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

class TSuggestionsButton extends StatelessWidget {
  const TSuggestionsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () => Get.to(() => const SuggestionsScreen()),
      text: TTexts.showSuggestions,
      backgroundGradient: TColors.recommendationGradient,
      textColor: TColors.black,
    );
  }
}
