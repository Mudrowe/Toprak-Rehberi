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
      land: json['land'],
      score: json['score'].toDouble(),
      productOptionDTO: json['productOptionDTO'],
      area: json['area'],
      isHarvested: json['isHarvested'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'plantingDate': THelperFunctions.getFormattedDate(plantingDate!),
        'harvestDate': THelperFunctions.getFormattedDate(harvestDate!),
        'land': land,
        'score': score,
        'productOptionDTO': productOptionDTO,
        'area': area,
        'isHarvested': isHarvested,
      };
}
