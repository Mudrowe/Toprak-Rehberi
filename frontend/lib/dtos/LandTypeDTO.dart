class LandTypeDTO {
  final int id;
  final String name;
  final String imageUrl;

  LandTypeDTO({required this.id, required this.name, required this.imageUrl});

  factory LandTypeDTO.fromJson(Map<String, dynamic> json) {
    return LandTypeDTO(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image_url'],
    );
  }
}
