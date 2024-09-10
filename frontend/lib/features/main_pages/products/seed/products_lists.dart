//import 'package:toprak_rehberi/features/main_pages/lands/widgets/lands_list.dart';
import 'package:toprak_rehberi/models/product.dart';
import 'package:toprak_rehberi/utils/constants/image_strings.dart';

// List of harvested products
final List<Product> harvestedProductsList = [
  // 0
  Product(
    productName: 'Ayçiçeği',
    progressPercentage: 1,
    landName: 'Bahçe 1',
    imagePath: TImages.sunflower,
    plantingDate: '3 Mart 2024',
    harvestDate: '12 Ocak 2025',
    isHarvested: true,
    area: 300,
    score: 3,
    //land: landsList[0],
  ),

  // 1
  Product(
    productName: 'Domates',
    progressPercentage: 1,
    landName: 'Bağ 1',
    imagePath: TImages.tomato,
    plantingDate: '15 Mayıs 2023',
    harvestDate: '21 Haziran 2024',
    isHarvested: true,
    area: 500,
    score: 4,
    //land: landsList[1],
  ),

  // 2
  Product(
    productName: 'Patlıcan',
    progressPercentage: 1,
    landName: 'Tarla 2',
    imagePath: TImages.eggplant,
    plantingDate: '1 Nisan 2023',
    harvestDate: '5 Mart 2024',
    isHarvested: true,
    area: 350,
    score: 1,
    //land: landsList[1],
  ),

  // 3
  Product(
    productName: 'Patates',
    progressPercentage: 1,
    landName: 'Bahçe 1',
    imagePath: TImages.potato,
    plantingDate: '20 Nisan 2023',
    harvestDate: '5 Haziran 2024',
    isHarvested: true,
    area: 450,
    score: 5,
    //land: landsList[2],
  ),

  // 4
  Product(
    productName: 'Elma',
    progressPercentage: 1,
    landName: 'Tarla 1',
    imagePath: TImages.apple,
    plantingDate: '10 Mayıs 2023',
    harvestDate: '2 Şubat 2024',
    isHarvested: true,
    area: 400,
    score: 2,
    //land: landsList[3],
  ),

  // 5
  Product(
    productName: 'Üzüm',
    progressPercentage: 1,
    landName: 'Tarla 1',
    imagePath: TImages.grape,
    plantingDate: '25 Nisan 2023',
    harvestDate: '16 Ekim 2023',
    isHarvested: true,
    area: 350,
    score: 4,
    //land: landsList[3],
  ),
];



// List of planted products (not yet harvested)
final List<Product> plantedProductsList = [
  // 0
  Product(
    productName: 'Üzüm',
    progressPercentage: 0.124,
    landName: 'Tarla 1',
    imagePath: TImages.grape,
    plantingDate: '2 Mayıs 2024',
    harvestDate: '14 Nisan 2025',
    area: 350,
    //land: landsList[0],
  ),

  // 1
  Product(
    productName: 'Patates',
    progressPercentage: 0.714,
    landName: 'Tarla 1',
    imagePath: TImages.potato,
    plantingDate: '15 Nisan 2024',
    harvestDate: '21 Aralık 2025',
    area: 450,
    //land: landsList[0],
  ),

  // 2
  Product(
    productName: 'Soğan',
    progressPercentage: 0.574,
    landName: 'Tarla 2',
    imagePath: TImages.onion,
    plantingDate: '20 Mart 2024',
    harvestDate: '5 Mart 2025',
    area: 300,
    //land: landsList[1],
  ),

  // 3
  Product(
    productName: 'Buğday',
    progressPercentage: 0.34,
    landName: 'Bahçe 1',
    imagePath: TImages.wheat,
    plantingDate: '10 Mayıs 2024',
    harvestDate: '5 Haziran 2025',
    area: 400,
    //land: landsList[2],
  ),

  // 4
  Product(
    productName: 'Elma',
    progressPercentage: 0.0445,
    landName: 'Bahçe 1',
    imagePath: TImages.apple,
    plantingDate: '5 Mayıs 2023',
    harvestDate: '2 Şubat 2024',
    area: 400,
    //land: landsList[3],
  ),

  // 5
  Product(
    productName: 'Havuç',
    progressPercentage: 0.444,
    landName: 'Bahçe 1',
    imagePath: TImages.carrot,
    plantingDate: '15 Nisan 2024',
    harvestDate: '1 Mayıs 2025',
    area: 350,
    //land: landsList[3],
  ),
];
