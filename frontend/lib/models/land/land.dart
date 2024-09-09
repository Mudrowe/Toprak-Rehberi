import 'package:toprak_rehberi/models/product/product.dart';
import 'package:toprak_rehberi/utils/constants/enums.dart';

import '../../dtos/LandDTO.dart';

class Land {
  final String landName;
  final LandType landType;
  final double area;
  final double plantedArea;
  bool isPlanted = false;
  final Address address;
  final List<Product>? plantedProducts;
  final List<Product>? harvestedProducts;

  Land({
    required this.area,
    required this.plantedArea,
    required this.isPlanted,
    required this.address,
    required this.landName,
    required this.landType,
    this.plantedProducts,
    this.harvestedProducts,
  });

  factory Land.fromJson(Map<String, dynamic> json) {
    return Land(
      landName: json['landName'],
      landType: LandType.values[json['landTypeId']],
      area: json['area'].toDouble(),
      plantedArea: json['plantedArea'].toDouble(),
      isPlanted: json['isPlanted'],
      address: Address(
        city: json['city'],
        district: json['district'],
        neighborhood: json['neighborhood'],
        parcelNo: json['parcelNo'],
        adaNo: json['adaNo'],
      ),
      plantedProducts: [], // Handle if you need product details
      harvestedProducts: [],
    );
  }
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



LandDTO convertLandToLandDTO(Land land, {int? userId, int? neighborhoodId, int? landTypeId}) {
  return LandDTO(
    userId: userId,
    name: land.landName,
    neighborhoodId: neighborhoodId,
    parcelNo: land.address.parcelNo,
    adaNo: land.address.adaNo,
    size: land.area,
    landTypeId: landTypeId,
  );
}
