class Product {
  final String productName;
  final String plantingDate;
  final String harvestDate;
  final String landName;
  final String imagePath;
  final double progressPercentage;
  final bool? isHarvested;
  final int? score;
  final double area;

  Product({
    required this.productName,
    required this.plantingDate,
    required this.harvestDate,
    required this.landName,
    required this.imagePath,
    required this.progressPercentage,
    required this.area,
    this.isHarvested,
    this.score,
  });
}
