final List<SuggestionProduct> suggesionsList = [
  SuggestionProduct(name: 'Patates', score: 93),
  SuggestionProduct(name: 'Soğan', score: 82),
  SuggestionProduct(name: 'Domates', score: 71),
  SuggestionProduct(name: 'Üzüm', score: 69),
  SuggestionProduct(name: 'Havuç', score: 58),
  SuggestionProduct(name: 'Çilek', score: 43),
  SuggestionProduct(name: 'Ayçiçeği', score: 31),
  SuggestionProduct(name: 'Elma', score: 25),
  SuggestionProduct(name: 'Çilek', score: 21),
  SuggestionProduct(name: 'Buğday', score: 13),
];

class SuggestionProduct {
  final String name;
  final double score;

  SuggestionProduct({required this.name, required this.score});
}
