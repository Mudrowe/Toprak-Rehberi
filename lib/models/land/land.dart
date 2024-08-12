import 'package:toprak_rehberi/models/product/product.dart';
import 'package:toprak_rehberi/utils/constants/enums.dart';

class Land {
  final String landName;
  final LandType landType;
  final double area;
  final double plantedArea;
  bool isPlanted = false;
  final Address adres;
  final List<Product>? plantedProducts;

  Land(
      {required this.area,
      required this.plantedArea,
      required this.isPlanted,
      required this.adres,
      required this.landName,
      required this.landType,
      this.plantedProducts});
}

class Address {
  final String city;
  final String district;
  final String neighborhood;
  final String parcelNo;
  final String adaNo;

  Address({
    required this.parcelNo,
    required this.adaNo,
    required this.city,
    required this.district,
    required this.neighborhood,
  });
}
