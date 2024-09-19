import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/dtos/LandDTO.dart';
import 'package:toprak_rehberi/features/main_pages/lands/land_details/widgets/helpers/suggestions_button.dart';
import 'package:toprak_rehberi/features/main_pages/lands/land_details/widgets/sections/land_details_info.dart';
import 'package:toprak_rehberi/features/main_pages/lands/land_details/widgets/sections/land_planted_products.dart';
import 'package:toprak_rehberi/features/main_pages/lands/land_details/widgets/sections/land_type_image.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

class TLandDetails extends StatefulWidget {
  final LandDTO landDTO;

  const TLandDetails({super.key, required this.landDTO});

  @override
  State<TLandDetails> createState() => _TLandDetailsState();
}

class _TLandDetailsState extends State<TLandDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // Suggestions Button
              TSuggestionsButton(landId: widget.landDTO.id!),

              const SizedBox(height: TSizes.spaceBtwItems),

              // Land Type Image
              TLandTypeImage(landDTO: widget.landDTO),

              const SizedBox(height: TSizes.spaceBtwItems),

              // Land Info
              TLandDetailsInfo(landDTO: widget.landDTO),

              const SizedBox(height: TSizes.spaceBtwSections),

              TLandProducts(landDTO: widget.landDTO)
            ],
          ),
        ),
      ),
    );
  }
}

