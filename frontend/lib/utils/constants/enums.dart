import 'dart:ui';

import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/image_strings.dart';

enum TextSizes { small, medium, large }

enum ProductStatus { growing, harvested }

enum LandType { tarla, bag, bahce }

enum Times { last30days, last3months, thisYear, lastYear, specialFilter}

extension LandTypeExtension on LandType {
  String get displayName {
    switch (this) {
      case LandType.bag:
        return 'Bağ';
      case LandType.bahce:
        return 'Bahçe';
      case LandType.tarla:
        return 'Tarla';
      default:
        return 'Bilinmeyen';
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

extension LandTypeImageExtension on LandType {
  String get imagePath {
    switch (this) {
      case LandType.tarla:
        return TImages.tarla;
      case LandType.bahce:
        return TImages.bahce;
      case LandType.bag:
        return TImages.bag;
      default:
        return TImages.tarla;
    }
  }
}
