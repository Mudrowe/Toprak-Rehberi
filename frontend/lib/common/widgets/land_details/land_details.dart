import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/common/widgets/land_details/widgets/helpers/suggestions_button.dart';
import 'package:toprak_rehberi/common/widgets/land_details/widgets/sections/land_details_info.dart';
import 'package:toprak_rehberi/common/widgets/land_details/widgets/sections/land_planted_products.dart';
import 'package:toprak_rehberi/common/widgets/land_details/widgets/sections/land_type_image.dart';
import 'package:toprak_rehberi/dtos/LandDTO.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

class TLandDetails extends StatelessWidget {
  final LandDTO landDTO;

  const TLandDetails({super.key, required this.landDTO});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // Suggestions Button
              const TSuggestionsButton(),

              const SizedBox(height: TSizes.spaceBtwItems),

              // Land Type Image
              TLandTypeImage(landDTO: landDTO),

              const SizedBox(height: TSizes.spaceBtwItems),

              // Land Info
              TLandDetailsInfo(landDTO: landDTO),

              const SizedBox(height: TSizes.spaceBtwSections),

              TLandPlantedProducts(landDTO: landDTO)
            ],
          ),
        ),
      ),
    );
  }
}

