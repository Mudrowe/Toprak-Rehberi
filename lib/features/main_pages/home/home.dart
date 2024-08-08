import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:toprak_rehberi/features/main_pages/home/widgets/pie_chart.dart';
import 'package:toprak_rehberi/features/main_pages/home/widgets/product_card_home.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 1,
                  aspectRatio: 3,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 10),
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  ),
              items: const [
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
            const SizedBox(height: TSizes.spaceBtwItems),
            const Text('Ekili Olan Toplam Ürün Sayınız 13'),
            const TPieChart(
              chartName: 'ÜRÜN DAĞILIMINIZ',
            ),
            const TPieChart(
              chartName: 'ARAZİ TİPİ DAĞILIMINIZ',
            ),
          ],
        ),
      ),
    );
  }
}
