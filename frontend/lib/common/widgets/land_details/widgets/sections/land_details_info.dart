import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/land_details/widgets/helpers/add_product_button.dart';
import 'package:toprak_rehberi/models/land.dart';

import '../../../../../utils/constants/sizes.dart';
import 'land_details_column.dart';

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
            child: TLandDetailsColumn(land: land),
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
