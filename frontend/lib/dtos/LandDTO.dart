import 'package:toprak_rehberi/dtos/LandTypeDTO.dart';
import 'package:toprak_rehberi/dtos/location/NeighborhoodDTO.dart';

import '../models/land.dart';
import '../utils/constants/enums.dart';

class LandDTO {
  final int? id;
  int? userId;
  final String name;
  final NeighborhoodDTO neighborhoodDTO;
  final String parcelNo;
  final String adaNo;
  final double area;
  final LandTypeDTO landTypeDTO;

  LandDTO({
    this.id,
    this.userId,
    required this.name,
    required this.neighborhoodDTO,
    required this.parcelNo,
    required this.adaNo,
    required this.area,
    required this.landTypeDTO,
  });

  factory LandDTO.fromJson(Map<String, dynamic> json) {
    return LandDTO(
      id: json['id'] != null ? json['id'] as int : null,
      userId: json['userId'] != null ? json['userId'] as int : null,
      name: json['name'],
      neighborhoodDTO: json['neighborhoodDTO'],
      parcelNo: json['parcelNo'],
      adaNo: json['adaNo'],
      area: json['area'].toDouble(),
      landTypeDTO: json['landTypeDTO'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'name': name,
        'neighborhoodDTO': neighborhoodDTO,
        'parcelNo': parcelNo,
        'adaNo': adaNo,
        'area': area,
        'landTypeDTO': landTypeDTO,
      };
}

Land convertLandDTOToLand(LandDTO landDTO, Address address) {
  LandTypeDTO landType = landDTO.landTypeDTO;

  return Land(
    landName: landDTO.name,
    landType: landType,
    area: landDTO.area,
    plantedArea: 0.0, // Default or computed value
    isPlanted: false, // Default or computed value
    address: address,
    plantedProducts: [], // Default or fetched value
    harvestedProducts: [], // Default or fetched value
  );
}
