import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/land_details/widgets/helpers/add_product_button.dart';
import 'package:toprak_rehberi/common/widgets/land_details/widgets/helpers/build_land_info_row.dart';
import 'package:toprak_rehberi/models/land.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

import '../../../../../utils/constants/sizes.dart';

class TLandDetailsInfo extends StatelessWidget {
  final Land land;

  const TLandDetailsInfo({super.key, required this.land});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: TSizes.xl, right: TSizes.xl),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  label: TTexts.size,
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
          ),


          // Add Product Button
          TAddProductButton(
            land: land,
          ),
        ],
      ),
    );
  }
}
