import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';

class TPieChart extends StatelessWidget {
  final String chartName;

  const TPieChart({super.key, required this.chartName});


  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.3,
        child: Row(  
          children: [
            Expanded(
              child: Stack(alignment: Alignment.center, children: [
                Text(
                  chartName,
                  style: const TextStyle(
                      color: TColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                PieChart(
                  PieChartData(sections: [
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
                        value: 38,
                        showTitle: false,
                        color: TColors.pieChartColor4,
                        title: '%38'),
                  ], centerSpaceRadius: 90),
                ),
              ]),
            ),
            
            const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    percentage: '38%',
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String productName;
  final String percentage;

  const LegendItem(
      {super.key,
      required this.color,
      required this.productName,
      required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            width: 10,
            height: 10,
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
            Text(
              productName,
              style: const TextStyle(
                  color: TColors.darkGrey, fontWeight: FontWeight.bold),
            ),
            Text(percentage,
                style: const TextStyle(
                    color: TColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ]),
        ],
      ),
    );
  }
}
