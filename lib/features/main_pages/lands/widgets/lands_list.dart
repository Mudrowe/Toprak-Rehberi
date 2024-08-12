import 'package:toprak_rehberi/features/main_pages/products/widgets/product_card/products_lists.dart';
import 'package:toprak_rehberi/models/land/land.dart';
import 'package:toprak_rehberi/utils/constants/enums.dart';

final List<Land> landsList = [
  Land(
    landName: 'Tarla 1',
    area: 1000,
    plantedArea: 500,
    isPlanted: true,
    landType: LandType.tarla,
    adres: Address(
      city: 'Ankara',
      district: 'Polatlı',
      neighborhood: 'Özyurt',
      parcelNo: '898',
      adaNo: '0',
    ),
    plantedProducts: plantedProductsList.sublist(0, 2),
  ),
  Land(
    landName: 'Tarla 2',
    area: 1000,
    plantedArea: 700,
    isPlanted: true,
    landType: LandType.tarla,
    adres: Address(
      city: 'Ankara',
      district: 'Polatlı',
      neighborhood: 'Sarıoba',
      parcelNo: '189',
      adaNo: '8',
    ),
    plantedProducts: plantedProductsList.sublist(2, 3),
  ),
  Land(
    landName: 'Bağ 1',
    area: 1000,
    plantedArea: 0,
    isPlanted: false,
    landType: LandType.bag,
    adres: Address(
      city: 'Ankara',
      district: 'Polatlı',
      neighborhood: 'Özyurt',
      parcelNo: '898',
      adaNo: '0',
    ),
    plantedProducts: plantedProductsList.sublist(3, 4),
  ),
  Land(
    landName: 'Bahçe 1',
    area: 850,
    plantedArea: 300,
    isPlanted: true,
    landType: LandType.bahce,
    adres: Address(
      city: 'Ankara',
      district: 'Ayaş',
      neighborhood: 'Ilıca',
      parcelNo: '121',
      adaNo: '130',
    ),
    plantedProducts: plantedProductsList.sublist(4, 5),
  ),
];
