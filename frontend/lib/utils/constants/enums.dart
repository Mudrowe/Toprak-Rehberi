import 'dart:ui';

import 'package:toprak_rehberi/utils/constants/colors.dart';

import '../../dtos/LandTypeDTO.dart';

enum TextSizes { small, medium, large }

enum ProductStatus { growing, harvested }

enum LandType { tarla, bag, bahce }

enum Times { last30days, last3months, thisYear, lastYear, specialFilter}

extension LandTypeDTOExtension on LandTypeDTO {
  LandType toLandType() {
    switch (id) {
      case 4:
        return LandType.tarla;
      case 5:
        return LandType.bahce;
      case 6:
        return LandType.bag;
      default:
        return LandType.tarla;
    }
  }
}

extension LandTypeColorExtension on LandType {
  Color get color {
    switch (this) {
      case LandType.tarla:
        return TColors.tarla;
      case LandType.bahce:
        return TColors.bahce;
      case LandType.bag:
        return TColors.bag;
      default:
        return TColors.grey;
    }
  }
}
