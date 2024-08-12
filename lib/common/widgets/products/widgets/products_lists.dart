import 'package:toprak_rehberi/models/product/product.dart';
import 'package:toprak_rehberi/utils/constants/image_strings.dart';

// List of harvested products
final List<Product> harvestedProductsList = [
  Product(
    productName: 'Ayçiçeği',
    progressPercentage: 1,
    fieldName: 'Bahçe 3',
    imagePath: TImages.sunflower,
    harvestDate: '12 Ocak 2021',
    score: 3,
  ),
  Product(
    productName: 'Domates',
    progressPercentage: 1,
    fieldName: 'Bağ 2',
    imagePath: TImages.tomato,
    harvestDate: '21 Haziran 2023',
    score: 4,
  ),
  Product(
    productName: 'Patlıcan',
    progressPercentage: 1,
    fieldName: 'Tarla 2',
    imagePath: TImages.eggplant,
    harvestDate: '5 Mart 2024',
    score: 1,
  ),
  Product(
    productName: 'Patates',
    progressPercentage: 1,
    fieldName: 'Bahçe 1',
    imagePath: TImages.potato,
    harvestDate: '5 Haziran 2021',
    score: 5,
  ),
  Product(
    productName: 'Elma',
    progressPercentage: 1,
    fieldName: 'Tarla 1',
    imagePath: TImages.apple,
    harvestDate: '2 Şubat 2024',
    score: 2,
  ),
  Product(
    productName: 'Üzüm',
    progressPercentage: 1,
    fieldName: 'Arazi 1',
    imagePath: TImages.grape,
    harvestDate: '16 Ekim 2023',
    score: 4,
  ),
];

// List of planted products (not yet harvested)
final List<Product> plantedProductsList = [
  Product(
    productName: 'Üzüm',
    progressPercentage: 0.124,
    fieldName: 'Arazi 1',
    imagePath: TImages.grape,
    harvestDate: '14 Nisan 2024',
  ),
  Product(
    productName: 'Patates',
    progressPercentage: 0.714,
    fieldName: 'Arazi 3',
    imagePath: TImages.potato,
    harvestDate: '21 Aralık 2024',
  ),
  Product(
    productName: 'Soğan',
    progressPercentage: 0.574,
    fieldName: 'Tarla 2',
    imagePath: TImages.onion,
    harvestDate: '5 Mart 2024',
  ),
  Product(
    productName: 'Buğday',
    progressPercentage: 0.34,
    fieldName: 'Bahçe 1',
    imagePath: TImages.wheat,
    harvestDate: '5 Haziran 2022',
  ),
  Product(
    productName: 'Elma',
    progressPercentage: 0.0445,
    fieldName: 'Tarla 1',
    imagePath: TImages.apple,
    harvestDate: '2 Şubat 2024',
  ),
  Product(
    productName: 'Havuç',
    progressPercentage: 0.444,
    fieldName: 'Arazi 1',
    imagePath: TImages.carrot,
    harvestDate: '1 Mayıs 2024',
  ),
];
