import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/device/device_utility.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: TSizes.appBarHeight),

        Padding(
          padding: const EdgeInsets.all(TSizes.defaulSpace),
          child: Container(
            height: 500,
            width: TDeviceUtils.getScreenWidth(context),
            decoration: getCardDecoration(context),
          ),
        ),
      ],
    );
  }
}
