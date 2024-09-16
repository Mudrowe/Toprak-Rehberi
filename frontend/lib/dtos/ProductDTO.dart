import 'package:toprak_rehberi/dtos/LandDTO.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

import 'ProductOptionDTO.dart';

class ProductDTO {
  final int? id;
  final DateTime? plantingDate;
  final DateTime? harvestDate;
  final LandDTO land;
  final double? score;
  final ProductOptionDTO productOptionDTO;
  double? area;
  bool isHarvested;

  ProductDTO({
    this.id,
    required this.plantingDate,
    required this.harvestDate,
    required this.land,
    required this.score,
    required this.productOptionDTO,
    required this.area,
    required this.isHarvested,
  });

  double get progressPercentage {
    final currentDate = DateTime.now();
    if (currentDate.isAfter(harvestDate!)) {
      return 100.0; // Fully harvested
    }
    if (currentDate.isBefore(plantingDate!)) {
      return 0.0; // Not started
    }

    final totalDuration = harvestDate?.difference(plantingDate!).inDays;
    final currentDuration = currentDate.difference(plantingDate!).inDays;

    return (currentDuration / totalDuration!) * 100;
  }

  factory ProductDTO.fromJson(Map<String, dynamic> json) {
    return ProductDTO(
      id: json['id'],
      plantingDate: DateTime.parse(json['plantingDate']),
      harvestDate: DateTime.parse(json['harvestDate']),
      land: LandDTO.fromJson(json['land']),
      score: json['score'].toDouble(),
      productOptionDTO: ProductOptionDTO.fromJson(json['productOption']),
      area: json['area'],
      isHarvested: json['harvested'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'plantingDate': THelperFunctions.getIso8601Date(plantingDate!),
        'harvestDate': THelperFunctions.getIso8601Date(harvestDate!),
        'land': land.toJson(),
        'score': score,
        'productOption': productOptionDTO.toJson(),
        'area': area,
        'harvested': isHarvested,
      };
}
