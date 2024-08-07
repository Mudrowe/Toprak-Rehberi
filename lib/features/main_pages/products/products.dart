import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:toprak_rehberi/common/widgets/products/product_card.dart';
import 'package:toprak_rehberi/utils/constants/image_strings.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            TSearchContainer(
              text: 'Ürün ara',
            ),
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            TProductCard(
              productName: 'Üzüm',
              progressPercentage: 0.124,
              fieldName: 'Arazi 1',
              imagePath: TImages.grape,
              harvestDate: '14 Nisan 2024',
            ),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            TProductCard(
              productName: 'Patates',
              progressPercentage: 0.714,
              fieldName: 'Arazi 3',
              imagePath: TImages.potato,
              harvestDate: '21 Aralık 2024',
            ),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            TProductCard(
              productName: 'Soğan',
              progressPercentage: 0.574,
              fieldName: 'Tarla 2',
              imagePath: TImages.onion,
              harvestDate: '5 Mart 2024',
            ),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            TProductCard(
              productName: 'Buğday',
              progressPercentage: 0.34,
              fieldName: 'Bahçe 1',
              imagePath: TImages.wheat,
              harvestDate: '5 Haziran 2022',
            ),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            TProductCard(
              productName: 'Elma',
              progressPercentage: 0.0445,
              fieldName: 'Tarla 1',
              imagePath: TImages.apple,
              harvestDate: '2 Şubat 2024',
            ),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            TProductCard(
              productName: 'Havuç',
              progressPercentage: 0.444,
              fieldName: 'Arazi 1',
              imagePath: TImages.carrot,
              harvestDate: '1 Mayıs 2024',
            ),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),
          ],
        ),
      ),
    );
  }
}
