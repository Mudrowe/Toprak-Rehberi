class CityDTO {
  final int id;
  final String name;

  CityDTO({
    required this.id,
    required this.name,
  });

  factory CityDTO.fromJson(Map<String, dynamic> json) {
    return CityDTO(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
