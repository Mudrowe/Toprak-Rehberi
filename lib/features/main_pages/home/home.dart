import 'package:flutter/material.dart';
import 'package:toprak_rehberi/features/main_pages/home/widgets/card_slider.dart';
import 'package:toprak_rehberi/features/main_pages/home/widgets/pie_chart.dart';
import 'package:toprak_rehberi/features/main_pages/home/widgets/product_card_home.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            TCardSlider(
              cards: [
                TProductCardHome(
                    productName: 'Üzüm',
                    harvestDate: '21 Nisan 2024',
                    fieldName: 'Bahçe 3',
                    progressPercentage: 0.123),
                TProductCardHome(
                    productName: 'Çilek',
                    harvestDate: '21 Nisan 2024',
                    fieldName: 'Bahçe 3',
                    progressPercentage: 0.83),
                TProductCardHome(
                    productName: 'Havuç',
                    harvestDate: '21 Nisan 2024',
                    fieldName: 'Bahçe 3',
                    progressPercentage: 0.57),
                TProductCardHome(
                    productName: 'Buğday',
                    harvestDate: '21 Nisan 2024',
                    fieldName: 'Bahçe 3',
                    progressPercentage: 0.953),
              ],
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            Text('Ekili Olan Toplam Ürün Sayınız 13'),
            TPieChart(
              chartName: 'ÜRÜN DAĞILIMINIZ',
            ),
            TPieChart(
              chartName: 'ARAZİ TİPİ DAĞILIMINIZ',
            ),
          ],
        ),
      ),
    );
  }
}
