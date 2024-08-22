import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:toprak_rehberi/features/main_pages/products/seed/products_lists.dart';
import 'package:toprak_rehberi/features/main_pages/home/widgets/card_slider.dart';
import 'package:toprak_rehberi/features/main_pages/home/widgets/legend_item.dart';
import 'package:toprak_rehberi/features/main_pages/home/widgets/pie_chart.dart';
import 'package:toprak_rehberi/features/main_pages/home/widgets/product_card_home.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

// TODO: So, Stats are not compatible with products in the productsScreen

// ! FIX: There isn't any length check for legendItems.
// ! FIX: If there would be too many items, the screen will break

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final Color textColor = dark ? TColors.white : TColors.black;
    final List<TProductCardHome> cards = [
      for (var product in plantedProductsList)
        TProductCardHome(product: product),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: TSizes.spaceBtwSections),
        
            // Carousel Slider
            TCardSlider(cards: cards),
        
            const SizedBox(height: TSizes.spaceBtwItems),
        
            // Products stats
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  TTexts.totalProducts,
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Text(
                  '200',
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
        
            // Products Pie Chart
            TPieChart(
              chartName: TTexts.productDistribution,
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
        
            const SizedBox(height: TSizes.spaceBtwItems),
        
            // Lands Stats
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  TTexts.totalLands,
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Text(
                  '100',
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
        
            // Lands Pie Chart
            TPieChart(
              chartName: TTexts.landDistribution,
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
      ),
    );
  }
}