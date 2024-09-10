class ProductDTO {
  final int? id;
  final DateTime? plantingDate;
  final DateTime? harvestDate;
  final int? landId;
  final double? score;
  final int productOptionId;
  final String? productName;
  final String? imageUrl;
  final String landName;
  final double area;

  ProductDTO({
    this.id,
    required this.plantingDate,
    required this.harvestDate,
    this.landId,
    required this.score,
    required this.productOptionId,
    required this.productName,
    required this.imageUrl,
    required this.landName,
    required this.area,
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

  bool get isHarvested => progressPercentage == 100;

  factory ProductDTO.fromJson(Map<String, dynamic> json) {
    return ProductDTO(
      id: json['id'],
      plantingDate: DateTime.parse(json['plantingDate']),
      harvestDate: DateTime.parse(json['harvestDate']),
      landId: json['landId'],
      score: json['score'].toDouble(),
      productOptionId: json['productOptionId'],
      productName: json['productName'],
      imageUrl: json['imageUrl'],
      landName: json['landName'],
      area: json['area']
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'plantingDate': plantingDate?.toIso8601String(),
    'harvestDate': harvestDate?.toIso8601String(),
    'landId': landId,
    'score': score,
    'productOptionId': productOptionId,
    'productName': productName,
    'imageUrl': imageUrl,
    'size': area,
  };
}
