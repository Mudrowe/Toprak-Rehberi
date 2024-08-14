import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/custom_elevated_button.dart';
import 'package:toprak_rehberi/common/widgets/land_details/widgets/sections/land_details_info.dart';
import 'package:toprak_rehberi/common/widgets/land_details/widgets/sections/land_planted_products.dart';
import 'package:toprak_rehberi/common/widgets/land_details/widgets/sections/land_type_image.dart';
import 'package:toprak_rehberi/models/land/land.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

class TLandDetails extends StatelessWidget {
  final Land land;

  const TLandDetails({super.key, required this.land});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // Recommendations Button
              CustomElevatedButton(
                onPressed: () {},
                text: TTexts.showSuggestions,
                backgroundGradient: TColors.recommendationGradient,
                textColor: TColors.black,
              ),

              const SizedBox(height: TSizes.spaceBtwItems),

              // Land Type Image
              TLandTypeImage(land: land),

              const SizedBox(height: TSizes.spaceBtwItems),

              // Land Info
              TLandDetailsInfo(land: land),

              const SizedBox(height: TSizes.spaceBtwSections),

              TLandPlantedProducts(land: land)
            ],
          ),
        ),
      ),
    );
  }
}
