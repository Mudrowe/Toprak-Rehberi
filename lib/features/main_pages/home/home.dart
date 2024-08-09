import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:toprak_rehberi/features/main_pages/home/widgets/card_slider.dart';
import 'package:toprak_rehberi/features/main_pages/home/widgets/pie_chart.dart';
import 'package:toprak_rehberi/features/main_pages/home/widgets/product_card_home.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

// TODO: ProductCards aren't recieved dynamically.
// TODO: So, Stats are not compatible with products in the productsScreen


// ! FIX: There isn't any length check for legendItems.
// ! FIX: If there would be too many items, the screen will break



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          const TCardSlider(
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
          const SizedBox(height: TSizes.spaceBtwItems),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Ekili Olan Toplam Ürün Sayınız',
                style: TextStyle(
                    color: TColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Text(
                '200',
                style: TextStyle(
                    color: TColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ],
          ),
          TPieChart(
            chartName: 'ÜRÜN DAĞILIMINIZ',
            sections: [
              PieChartSectionData(
                  value: 25,
                  showTitle: false,
                  color: TColors.pieChartColor1,
                  title: '25%'),
              PieChartSectionData(
                  value: 29,
                  showTitle: false,
                  color: TColors.pieChartColor2,
                  title: '%29'),
              PieChartSectionData(
                value: 28,
                showTitle: false,
                color: TColors.pieChartColor3,
              ),
              PieChartSectionData(
                  value: 18,
                  showTitle: false,
                  color: TColors.pieChartColor4,
                  title: '%18'),
            ],
            legendItems: const [
              LegendItem(
                color: TColors.pieChartColor1,
                productName: 'Patates',
                percentage: '25%',
              ),
              LegendItem(
                color: TColors.pieChartColor2,
                productName: 'Buğday',
                percentage: '29%',
              ),
              LegendItem(
                color: TColors.pieChartColor3,
                productName: 'Havuç',
                percentage: '28%',
              ),
              LegendItem(
                color: TColors.pieChartColor4,
                productName: 'Çilek',
                percentage: '18%',
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Toplam Arazi Sayınız',
                style: TextStyle(
                    color: TColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Text(
                '100',
                style: TextStyle(
                    color: TColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ],
          ),
          TPieChart(
            chartName: 'ARAZİ TİPİ DAĞILIMINIZ',
            sections: [
              PieChartSectionData(
                  value: 60,
                  showTitle: false,
                  color: TColors.pieChartColor4,
                  title: '60%'),
              PieChartSectionData(
                  value: 15,
                  showTitle: false,
                  color: TColors.pieChartColor2,
                  title: '%15'),
              PieChartSectionData(
                  value: 25,
                  showTitle: false,
                  color: TColors.pieChartColor3,
                  title: '%25'),
            ],
            legendItems: const [
              LegendItem(
                color: TColors.pieChartColor4,
                productName: 'Tarla',
                percentage: '60%',
              ),
              LegendItem(
                color: TColors.pieChartColor2,
                productName: 'Bahçe',
                percentage: '15%',
              ),
              LegendItem(
                color: TColors.pieChartColor3,
                productName: 'Bağ',
                percentage: '25%',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
