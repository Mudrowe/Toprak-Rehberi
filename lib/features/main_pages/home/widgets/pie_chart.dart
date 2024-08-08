import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';

class TPieChart extends StatelessWidget {
  final String chartName;
  final List<PieChartSectionData> sections;
  final List<LegendItem> legendItems;

  const TPieChart(
      {super.key,
      required this.chartName,
      required this.sections,
      required this.legendItems});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.5,
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
                  PieChartData(
                      sections: sections.map((section) {
                        return section;
                      }).toList(),
                      centerSpaceRadius: 90),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: legendItems.map((legendItem) {
                  return legendItem;
                }).toList(),
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
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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