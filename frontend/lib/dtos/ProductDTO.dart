import 'dart:convert';

class ProductDTO {
  final int id;
  final DateTime plantingDate;
  final DateTime harvestDate;
  final int? landId; // Reference to the land ID, can be null
  final double score;
  final int? productOptionId; // Can be null

  ProductDTO({
    required this.id,
    required this.plantingDate,
    required this.harvestDate,
    this.landId,
    required this.score,
    this.productOptionId,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) {
    return ProductDTO(
      id: json['id'],
      plantingDate: DateTime.parse(json['plantingDate']),
      harvestDate: DateTime.parse(json['harvestDate']),
      landId: json['landId'] != null ? json['landId'] as int : null,
      score: json['score'].toDouble(),
      productOptionId: json['productOptionId'] != null ? json['productOptionId'] as int : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'plantingDate': plantingDate.toIso8601String(),
    'harvestDate': harvestDate.toIso8601String(),
    'landId': landId,
    'score': score,
    'productOptionId': productOptionId,
  };
}
