import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/land_details/widgets/helpers/add_product_button.dart';
import 'package:toprak_rehberi/dtos/LandDTO.dart';

import '../../../../../utils/constants/sizes.dart';
import 'land_details_column.dart';

class TLandDetailsInfo extends StatelessWidget {
  final LandDTO landDTO;

  const TLandDetailsInfo({super.key, required this.landDTO});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: TSizes.xl, right: TSizes.xl),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: TLandDetailsColumn(landDTO: landDTO),
          ),

          // Add Product Button
          TAddProductButton(
            landDTO: landDTO,
          ),
        ],
      ),
    );
  }
}
