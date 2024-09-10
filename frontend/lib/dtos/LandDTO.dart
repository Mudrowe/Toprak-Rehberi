import '../models/land.dart';
import '../utils/constants/enums.dart';

class LandDTO {
  final int? id;
  int? userId;
  final String name;
  final int? neighborhoodId;
  final String parcelNo;
  final String adaNo;
  final double size;
  final int? landTypeId;

  LandDTO({
    this.id,
    this.userId,
    required this.name,
    this.neighborhoodId,
    required this.parcelNo,
    required this.adaNo,
    required this.size,
    required this.landTypeId,
  });

  factory LandDTO.fromJson(Map<String, dynamic> json) {
    return LandDTO(
      id: json['id'] != null ? json['id'] as int : null,
      userId: json['userId'] != null ? json['userId'] as int : null,
      name: json['name'],
      neighborhoodId:
          json['neighborhoodId'],
      parcelNo: json['parcelNo'],
      adaNo: json['adaNo'],
      size: json['size'].toDouble(),
      landTypeId: json['landTypeId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'name': name,
        'neighborhoodId': neighborhoodId,
        'parcelNo': parcelNo,
        'adaNo': adaNo,
        'size': size,
        'landTypeId': landTypeId,
      };
}

Land convertLandDTOToLand(LandDTO landDTO, LandType landType, Address address) {
  return Land(
    landName: landDTO.name,
    landType: landType,
    area: landDTO.size,
    plantedArea: 0.0, // Default or computed value
    isPlanted: false, // Default or computed value
    address: address,
    plantedProducts: [], // Default or fetched value
    harvestedProducts: [], // Default or fetched value
  );
}
