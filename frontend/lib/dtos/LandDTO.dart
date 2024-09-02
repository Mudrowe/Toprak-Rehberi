import 'dart:convert';

class LandDTO {
  final int? id; // Nullable to handle cases where ID might be missing
  final int? userId; // Nullable
  final String name;
  final int? neighborhoodId; // Nullable
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
      neighborhoodId: json['neighborhoodId'] != null ? json['neighborhoodId'] as int : null,
      parcelNo: json['parcelNo'],
      adaNo: json['adaNo'],
      size: json['size'].toDouble(),
      landTypeId: json['landTypeId'] != null ? json['landTypeId'] as int : null,
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
  };
}
