import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:toprak_rehberi/features/main_pages/home/widgets/legend_item.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

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
    final dark = THelperFunctions.isDarkMode(context);
    final Color textColor = dark ? TColors.white : TColors.black;

    return AspectRatio(
        aspectRatio: 1.5,
        child: Row(
          children: [
            Expanded(
              child: Stack(alignment: Alignment.center, children: [
                Text(
                  chartName,
                  style: TextStyle(
                      color: textColor,
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

