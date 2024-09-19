class SuggestionProduct {
  final String name;
  final double score;
  final int productOptionId;

  SuggestionProduct({
    required this.name,
    required this.score,
    required this.productOptionId,
  });

  factory SuggestionProduct.fromJson(Map<String, dynamic> json) {
    return SuggestionProduct(
      name: json['name'],
      score: json['score'].toDouble(),
      productOptionId: json['productOptionId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'score': score,
        'productOptionId': productOptionId,
      };
}
