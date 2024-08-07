import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: TProductCardHome(
                  productName: 'Üzüm',
                  harvestDate: '21 Nisan 2024',
                  fieldName: 'Bahçe 3',
                  progressPercentage: 0.123),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Center(
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  margin: const EdgeInsets.only(right: 105, left: 15),
                  child: PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(value: 25, color: const Color(0xFF0D2535)),
                        PieChartSectionData(value: 29, color: const Color(0xFF5388D8)),
                        PieChartSectionData(value: 8, color: const Color(0xFFBE3700)),
                        PieChartSectionData(value: 38, color: const Color(0xFFF4BE37)),
                      ]
                    )
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
