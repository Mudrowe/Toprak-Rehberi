// ! In the real version, there must be 2 digits after comma

final List<SuggestionProduct> suggesionsList = [
  SuggestionProduct(name: 'Patates', score: 93.1),
  SuggestionProduct(name: 'Soğan', score: 82.4),
  SuggestionProduct(name: 'Domates', score: 71.87),
  // ! This must be handled
  //SuggestionProduct(name: 'Domates', score: 71.88888888888888887),
  SuggestionProduct(name: 'Üzüm', score: 69.41),
  SuggestionProduct(name: 'Havuç', score: 58.88),
  SuggestionProduct(name: 'Çilek', score: 43.1),
  SuggestionProduct(name: 'Ayçiçeği', score: 31.2),
  SuggestionProduct(name: 'Elma', score: 25.41),
  SuggestionProduct(name: 'Buğday', score: 5.35),
];

class SuggestionProduct {
  final String name;
  final double score;

  SuggestionProduct({required this.name, required this.score});
}
