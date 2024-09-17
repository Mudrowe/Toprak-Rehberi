import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:toprak_rehberi/dtos/LandDTO.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../widgets/legend_item.dart';
import '../widgets/pie_chart.dart';

class LandStats extends StatelessWidget {
  final List<LandDTO> lands;

  const LandStats({super.key, required this.lands});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final Color textColor = dark ? TColors.white : TColors.black;

    final sections = lands.map((land) {
      return PieChartSectionData(
        value: land.area,
        showTitle: false,
        color: TColors.dynamicPieChartColors[
            lands.indexOf(land) % TColors.dynamicPieChartColors.length],
      );
    }).toList();

    final legendItems = lands.map((land) {
      return LegendItem(
        color: TColors.dynamicPieChartColors[
            lands.indexOf(land) % TColors.dynamicPieChartColors.length],
        productName: THelperFunctions.decodeUtf8(land.name),
        percentage:
            '${(land.area / lands.fold(0, (sum, l) => sum + l.area) * 100).toStringAsFixed(1)}%',
      );
    }).toList();

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              TTexts.totalLands,
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              '${lands.length}',
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        TPieChart(
          chartName: TTexts.landDistribution,
          sections: sections,
          legendItems: legendItems,
        ),
      ],
    );
    ;
  }
}
