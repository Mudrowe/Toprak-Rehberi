final List<SuggestionProduct> suggestionsList = [
  SuggestionProduct(name: 'Patates', score: 93.1, productOptionId: 13),
  SuggestionProduct(name: 'Soğan', score: 82.4, productOptionId: 14),
  SuggestionProduct(name: 'Domates', score: 71.888888888888887, productOptionId: 11),
  SuggestionProduct(name: 'Üzüm', score: 69.41, productOptionId: 18),
  SuggestionProduct(name: 'Havuç', score: 58.88, productOptionId: 17),
  SuggestionProduct(name: 'Ayçiçeği', score: 31.2, productOptionId: 12),
  SuggestionProduct(name: 'Elma', score: 25.41, productOptionId: 16),
  SuggestionProduct(name: 'Buğday', score: 5.35, productOptionId: 10),
  SuggestionProduct(name: 'Patlıcan', score: 1.35, productOptionId: 15),
];

class SuggestionProduct {
  final String name;
  final double score;
  final int productOptionId;

  SuggestionProduct({
    required this.name,
    required this.score,
    required this.productOptionId,
  });
}
