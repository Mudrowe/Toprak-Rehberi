import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/custom_elevated_button.dart';
import 'package:toprak_rehberi/common/widgets/land_details/widgets/add_product_button.dart';
import 'package:toprak_rehberi/common/widgets/land_details/widgets/build_land_info_row.dart';
import 'package:toprak_rehberi/common/widgets/land_details/widgets/land_type_image.dart';
import 'package:toprak_rehberi/features/main_pages/products/widgets/product_card/product_card.dart';
import 'package:toprak_rehberi/models/land/land.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/image_strings.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

class TLandDetails extends StatelessWidget {
  final Land land;

  const TLandDetails({super.key, required this.land});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
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
              TLandTypeImage(land: land, dark: dark),

              const SizedBox(height: TSizes.spaceBtwItems),

              // Land Info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      TBuildLandInfoRow(
                        label: TTexts.landName,
                        value: land.landName,
                      ),
                      TBuildLandInfoRow(
                        label: TTexts.city,
                        value: land.address.city,
                      ),
                      TBuildLandInfoRow(
                        label: TTexts.district,
                        value: land.address.district,
                      ),
                      TBuildLandInfoRow(
                        label: TTexts.neighborhood,
                        value: land.address.neighborhood,
                      ),
                      TBuildLandInfoRow(
                        label: TTexts.adaNo,
                        value: land.address.adaNo,
                      ),
                      TBuildLandInfoRow(
                        label: TTexts.parcelNo,
                        value: land.address.parcelNo,
                      ),
                      TBuildLandInfoRow(
                        label: TTexts.area,
                        value:
                            '${land.area.toInt().toString()} ${TTexts.squareSymbol}',
                      ),
                      TBuildLandInfoRow(
                        label: TTexts.plantedArea,
                        value:
                            '${land.plantedArea.toInt().toString()} ${TTexts.squareSymbol}',
                      ),
                    ],
                  ),

                  // Add Product Button
                  const TAddProductButton(),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Planted Products
              land.isPlanted
                  ? Column(
                      children: [
                        const Text(TTexts.plantedProducts),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        for (var product in land.plantedProducts!)
                          Column(
                            children: [
                              TProductCard(product: product),
                              const SizedBox(
                                height: TSizes.spaceBtwItems,
                              )
                            ],
                          ),
                      ],
                    )
                  : Column(
                      children: [
                        Image.asset(TImages.appLogo),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        const Text(
                          TTexts.noPorducts,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
