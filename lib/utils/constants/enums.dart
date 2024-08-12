import 'dart:ui';

import 'package:toprak_rehberi/utils/constants/colors.dart';

enum TextSizes { small, medium, large }

enum ProductStatus { growing, harvested }

enum LandType { tarla, bag, bahce }

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