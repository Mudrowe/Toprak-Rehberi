import 'dart:convert';

class DistrictDTO {
  final int id; // Dart does not have a `short` type, so `int` is used
  final String name;
  final int cityId; // Reference to the city ID
  final List<int> neighborhoodIds; // List of neighborhood IDs

  DistrictDTO({
    required this.id,
    required this.name,
    required this.cityId,
    required this.neighborhoodIds,
  });

  factory DistrictDTO.fromJson(Map<String, dynamic> json) {
    return DistrictDTO(
      id: json['id'],
      name: json['name'],
      cityId: json['cityId'],
      neighborhoodIds: List<int>.from(json['neighborhoodIds']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'cityId': cityId,
    'neighborhoodIds': neighborhoodIds,
  };
}
