import 'package:toprak_rehberi/dtos/location/CityDTO.dart';
import 'package:toprak_rehberi/dtos/location/DistrictDTO.dart';
import 'package:toprak_rehberi/dtos/location/NeighborhoodDTO.dart';
import 'package:toprak_rehberi/models/product.dart';

import '../dtos/LandTypeDTO.dart';


class Land {
  final String landName;
  final LandTypeDTO landType;
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
      landType: json['landTypeId'],
      area: json['area'],
      plantedArea: json['plantedArea'],
      isPlanted: json['isPlanted'] ?? false,
      address: Address.fromJson(json['address']),

    );
  }
}

class Address {
  final CityDTO city;
  final DistrictDTO district;
  final NeighborhoodDTO neighborhood;
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
