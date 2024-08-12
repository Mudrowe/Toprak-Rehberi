class Product {
  // TODO: Name can be too long and it breaks the card
  final String productName;
  final String harvestDate;
  final String fieldName;
  final String imagePath;
  final double progressPercentage;
  final bool isHarvested;
  final int score;

  Product({
    required this.productName,
    required this.harvestDate,
    required this.fieldName,
    required this.imagePath,
    required this.progressPercentage,
    this.isHarvested = false,
    this.score = 3,
  });
}
