import 'package:flutter/material.dart';
import 'package:toprak_rehberi/models/land/land.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

class TLandInfo extends StatelessWidget {
  const TLandInfo({
    super.key,
    required this.land,
  });

  final Land land;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              land.landName,
              style: const TextStyle(color: TColors.dark),
            ),
            Text(
              '${land.adres.city}  ${land.adres.district}',
              style: const TextStyle(color: TColors.dark),
            ),
            Text(
              '${land.area.toInt()} ${TTexts.squareSymbol}',
              style: const TextStyle(color: TColors.dark),
            ),
          ],
        ),

        // Is Planted Checkbox
        Row(
          children: [
            const Text(
              TTexts.isPlanted,
              style: TextStyle(color: TColors.dark),
            ),
            Checkbox(value: land.isPlanted, onChanged: (value) {}),
          ],
        ),
      ],
    );
  }
}
