import 'package:flutter/cupertino.dart';

import '../../../../../dtos/LandDTO.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../helpers/build_land_info_row.dart';

class TLandDetailsColumn extends StatelessWidget {
  const TLandDetailsColumn({
    super.key,
    required this.landDTO,
  });

  final LandDTO landDTO;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TBuildLandInfoRow(
          label: TTexts.landName,
          value: THelperFunctions.decodeUtf8(landDTO.name),
        ),
        TBuildLandInfoRow(
          label: TTexts.city,
          value: THelperFunctions.decodeUtf8(landDTO.cityDTO?.name ?? 'Unknown City'),
        ),
        TBuildLandInfoRow(
          label: TTexts.district,
          value: THelperFunctions.decodeUtf8(landDTO.districtDTO?.name ?? 'Unknown District'),
        ),
        TBuildLandInfoRow(
          label: TTexts.neighborhood,
          value: THelperFunctions.decodeUtf8(landDTO.neighborhoodDTO.name),
        ),
        TBuildLandInfoRow(
          label: TTexts.adaNo,
          value: landDTO.adaNo,
        ),
        TBuildLandInfoRow(
          label: TTexts.parcelNo,
          value: landDTO.parcelNo,
        ),
        TBuildLandInfoRow(
          label: TTexts.area,
          value: '${landDTO.area.toInt().toString()} ${TTexts.squareSymbol}',
        ),
        /*
        TBuildLandInfoRow(
          label: TTexts.plantedArea,
          value:
              '${land.plantedArea.toInt().toString()} ${TTexts.squareSymbol}',
        ),

         */
      ],
    );
  }
}
