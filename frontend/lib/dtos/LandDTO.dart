import 'package:toprak_rehberi/dtos/LandTypeDTO.dart';
import 'package:toprak_rehberi/dtos/location/NeighborhoodDTO.dart';

import '../service/fetching/constants/fetch_cities.dart';
import '../service/fetching/constants/fetch_districts.dart';
import 'location/CityDTO.dart';
import 'location/DistrictDTO.dart';

class LandDTO {
  final int? id;
  int? userId;
  final String name;
  final NeighborhoodDTO neighborhoodDTO;
  final String parcelNo;
  final String adaNo;
  final double area;
  final LandTypeDTO landTypeDTO;
  CityDTO? cityDTO;
  DistrictDTO? districtDTO;
  double? remainingArea;

  LandDTO({
    this.id,
    this.userId,
    required this.name,
    required this.neighborhoodDTO,
    required this.parcelNo,
    required this.adaNo,
    required this.area,
    required this.landTypeDTO,
    this.remainingArea,
  }) {
    _initializeCityAndDistrict();
  }

  factory LandDTO.fromJson(Map<String, dynamic> json) {
    final landDTO = LandDTO(
      id: json['id'],
      userId: json['userId'],
      name: json['name'],
      neighborhoodDTO: NeighborhoodDTO.fromJson(json['neighborhood']),
      parcelNo: json['parcelNo'],
      adaNo: json['adaNo'],
      area: json['area'],
      landTypeDTO: LandTypeDTO.fromJson(json['landType']),
      remainingArea: json['remainingArea'],
    );

    return landDTO;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'name': name,
        'neighborhood': neighborhoodDTO.toJson(),
        'parcelNo': parcelNo,
        'adaNo': adaNo,
        'area': area,
        'landType': landTypeDTO.toJson(),
        'remainingArea': remainingArea,
      };

  Future<void> _initializeCityAndDistrict() async {
    try {
      DistrictDTO district =
          await fetchDistrictById(neighborhoodDTO.districtId);
      CityDTO city = await fetchCityById(district.cityId);

      districtDTO = district;
      cityDTO = city;
    } catch (e) {
      print('Failed to fetch city or district: $e');
    }
  }
}
