import 'package:flutter/cupertino.dart';

import '../../../../../models/land.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../helpers/build_land_info_row.dart';

class TLandDetailsColumn extends StatelessWidget {
  const TLandDetailsColumn({
    super.key,
    required this.land,
  });

  final Land land;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TBuildLandInfoRow(
          label: TTexts.landName,
          value: THelperFunctions.decodeUtf8(land.landName),
        ),
        TBuildLandInfoRow(
          label: TTexts.city,
          value: land.address.city.name,
        ),
        TBuildLandInfoRow(
          label: TTexts.district,
          value: land.address.district.name,
        ),
        TBuildLandInfoRow(
          label: TTexts.neighborhood,
          value: land.address.neighborhood.name,
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
          value: '${land.area.toInt().toString()} ${TTexts.squareSymbol}',
        ),
        TBuildLandInfoRow(
          label: TTexts.plantedArea,
          value:
              '${land.plantedArea.toInt().toString()} ${TTexts.squareSymbol}',
        ),
      ],
    );
  }
}
