import 'package:toprak_rehberi/models/product.dart';
import 'package:toprak_rehberi/utils/constants/enums.dart';


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
      landName: json['name'],
      landType: LandType.values[json['landTypeId']],
      area: json['size'],
      plantedArea: json['plantedArea'],
      isPlanted: json['isPlanted'] ?? false,
      address: Address.fromJson(json['address']),
      /*
      plantedProducts: (json['plantedProducts'] as List<dynamic>?)
          ?.map((item) => Product.fromJson(item))
          .toList(),
      harvestedProducts: (json['harvestedProducts'] as List<dynamic>?)
          ?.map((item) => Product.fromJson(item))
          .toList(),
       */
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

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'],
      district: json['district'],
      neighborhood: json['neighborhood'],
      parcelNo: json['parcelNo'],
      adaNo: json['adaNo'],
    );
  }
}