import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/custom_elevated_button.dart';
import 'package:toprak_rehberi/models/land/land.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

class TLandDetails extends StatelessWidget {
  final Land land;

  const TLandDetails({super.key, required this.land});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const TAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: CustomElevatedButton(
            onPressed: () {},
            text: TTexts.showSuggestions,
            backgroundGradient: TColors.recommendationGradient,
            textColor: TColors.black,
          ),
        ),
      ),
    );
  }
}
