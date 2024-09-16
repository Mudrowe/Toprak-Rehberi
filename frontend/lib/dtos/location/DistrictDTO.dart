class DistrictDTO {
  final int id;
  final String name;
  final int cityId;

  DistrictDTO({
    required this.id,
    required this.name,
    required this.cityId,
  });

  factory DistrictDTO.fromJson(Map<String, dynamic> json) {
    return DistrictDTO(
      id: json['id'],
      name: json['name'],
      cityId: json['cityId'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'cityId': cityId,
  };
}
