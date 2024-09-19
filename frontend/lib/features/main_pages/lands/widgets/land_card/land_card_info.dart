import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toprak_rehberi/dtos/LandDTO.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

class TLandCardInfo extends StatelessWidget {
  const TLandCardInfo({
    super.key,
    required this.landDTO,
  });

  final LandDTO landDTO;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Column(
        children: [
          Column(
            children: [
              Text(
                THelperFunctions.decodeUtf8(landDTO.name),
                style: textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                THelperFunctions.toTitleCase(THelperFunctions.decodeUtf8(landDTO.cityDTO?.name ?? 'Unknown City')),
                style: textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                THelperFunctions.toTitleCase(THelperFunctions.decodeUtf8(landDTO.districtDTO?.name ?? 'Unknown District')),
                style: textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${landDTO.area.toInt()} ${TTexts.squareSymbol}',
                style: textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),

              // Is Planted Checkbox
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    TTexts.isPlanted,
                    style: textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Checkbox(value: false, onChanged: (value) {}),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
