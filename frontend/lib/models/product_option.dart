class ProductOption {
  final int id;
  final String name;
  final int plantingDuration;
  final String imageUrl;

  ProductOption({
    required this.id,
    required this.name,
    required this.plantingDuration,
    required this.imageUrl,
  });

  factory ProductOption.fromJson(Map<String, dynamic> json) {
    return ProductOption(
      id: json['id'],
      name: json['name'],
      plantingDuration: json['plantingDuration'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'plantingDuration': plantingDuration,
    'imageUrl': imageUrl,
  };
}