import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/custom_elevated_button.dart';
import 'package:toprak_rehberi/common/widgets/suggestions/suggestions_screen.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

class TSuggestionsButton extends StatelessWidget {
  final int landId;

  const TSuggestionsButton({
    super.key,
    required this.landId,
  });

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SuggestionsScreen(landId: landId),
        ),
      ),
      text: TTexts.showSuggestions,
      backgroundGradient: TColors.recommendationGradient,
      textColor: TColors.black,
      isShimmer: true,
    );
  }
}
