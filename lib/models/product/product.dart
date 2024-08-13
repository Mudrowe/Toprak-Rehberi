//import 'package:toprak_rehberi/models/land/land.dart';

class Product {
  // TODO: Name can be too long and it breaks the card
  final String productName;
  final String plantingDate;
  final String harvestDate;
  final String landName;
  final String imagePath;
  final double progressPercentage;
  final bool isHarvested;
  final int score;
  final double area;
  //final Land land;

  Product({
    //required this.land,
    required this.productName,
    required this.plantingDate,
    required this.harvestDate,
    required this.landName,
    required this.imagePath,
    required this.progressPercentage,
    required this.area,
    this.isHarvested = false,
    this.score = 3,
  });
}
