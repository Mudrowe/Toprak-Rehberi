import 'dart:convert';

class NeighborhoodDTO {
  int id;
  final String name;
  final int districtId;

  NeighborhoodDTO({
    required this.id,
    required this.name,
    required this.districtId,
  });

  factory NeighborhoodDTO.fromJson(Map<String, dynamic> json) {
    return NeighborhoodDTO(
      id: json['id'],
      name: json['name'],
      districtId: json['districtId'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'districtId': districtId,
  };
}
