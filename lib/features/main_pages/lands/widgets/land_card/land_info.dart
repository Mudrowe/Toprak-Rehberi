import 'package:flutter/material.dart';
import 'package:toprak_rehberi/models/land/land.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

class TLandInfo extends StatelessWidget {
  const TLandInfo({
    super.key,
    required this.land,
  });

  final Land land;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              land.landName,
              style: textTheme.bodyMedium,
            ),
            Text(
              '${land.address.city}  ${land.address.district}',
              style: textTheme.bodyMedium,
            ),
            Text(
              '${land.area.toInt()} ${TTexts.squareSymbol}',
              style: textTheme.bodyMedium,
            ),
          ],
        ),

        // Is Planted Checkbox
        Row(
          children: [
            Text(
              TTexts.isPlanted,
              style: textTheme.bodyMedium,
            ),
            Checkbox(value: land.isPlanted, onChanged: (value) {}),
          ],
        ),
      ],
    );
  }
}
