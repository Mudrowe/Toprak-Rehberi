import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:toprak_rehberi/common/widgets/products/product_card.dart';
import 'package:toprak_rehberi/utils/constants/image_strings.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

class THarvestedProducts extends StatelessWidget {
  const THarvestedProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        TSearchContainer(
          text: 'Ürün ara',
        ),
        SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        TProductCard(
          productName: 'Ayçiçeği',
          progressPercentage: 1,
          fieldName: 'Bahçe 3',
          imagePath: TImages.sunflower,
          harvestDate: '12 Ocak 2021',
          score: 3,
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        TProductCard(
          productName: 'Domates',
          progressPercentage: 1,
          fieldName: 'Bağ 2',
          imagePath: TImages.tomato,
          harvestDate: '21 Haziran 2023',
          score: 4,
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        TProductCard(
          productName: 'Patlıcan',
          progressPercentage: 1,
          fieldName: 'Tarla 2',
          imagePath: TImages.eggplant,
          harvestDate: '5 Mart 2024',
          score: 1,
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        TProductCard(
          productName: 'Patates',
          progressPercentage: 1,
          fieldName: 'Bahçe 1',
          imagePath: TImages.potato,
          harvestDate: '5 Haziran 2021',
          score: 5,
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        TProductCard(
          productName: 'Elma',
          progressPercentage: 1,
          fieldName: 'Tarla 1',
          imagePath: TImages.apple,
          harvestDate: '2 Şubat 2024',
          score: 2,
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        TProductCard(
          productName: 'Üzüm',
          progressPercentage: 1,
          fieldName: 'Arazi 1',
          imagePath: TImages.grape,
          harvestDate: '16 Ekim 2023',
          score: 4,
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
      ],
    );
  }
}
