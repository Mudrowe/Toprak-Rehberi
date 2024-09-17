import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:toprak_rehberi/dtos/LandDTO.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
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

    // Count occurrences of each land type
    final landTypeCounts = <String, int>{};
    for (final land in lands) {
      final typeName = land.landTypeDTO.name;
      if (landTypeCounts.containsKey(typeName)) {
        landTypeCounts[typeName] = landTypeCounts[typeName]! + 1;
      } else {
        landTypeCounts[typeName] = 1;
      }
    }

    // Create PieChartSectionData and LegendItem based on land types
    final sections = landTypeCounts.entries.map((entry) {
      return PieChartSectionData(
        value: entry.value.toDouble(),
        showTitle: false,
        color: TColors.dynamicPieChartColors[
        landTypeCounts.keys.toList().indexOf(entry.key) % TColors.dynamicPieChartColors.length],
      );
    }).toList();

    final legendItems = landTypeCounts.entries.map((entry) {
      return LegendItem(
        color: TColors.dynamicPieChartColors[
        landTypeCounts.keys.toList().indexOf(entry.key) % TColors.dynamicPieChartColors.length],
        productName: THelperFunctions.decodeUtf8(entry.key),
        percentage: '${(entry.value / landTypeCounts.values.fold(0, (sum, count) => sum + count) * 100).toStringAsFixed(1)}%',
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
        const Divider(
          indent: TSizes.dividerIndent,
          endIndent: TSizes.dividerIndent,
        ),
        TPieChart(
          chartName: TTexts.landDistribution, // Adjusted text
          sections: sections,
          legendItems: legendItems,
        ),
      ],
    );
  }
}
