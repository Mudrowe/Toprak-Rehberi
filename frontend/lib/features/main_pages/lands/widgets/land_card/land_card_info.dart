import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toprak_rehberi/models/land.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

class TLandCardInfo extends StatelessWidget {
  const TLandCardInfo({
    super.key,
    required this.land,
  });

  final Land land;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Column(
        children: [
          Column(
            children: [
              Text(
                utf8.decode(land.landName.codeUnits),
                style: textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                land.address.city.name,
                style: textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                land.address.district.name,
                style: textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${land.area.toInt()} ${TTexts.squareSymbol}',
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
                  Checkbox(value: land.isPlanted, onChanged: (value) {}),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
