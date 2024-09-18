import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:toprak_rehberi/dtos/ProductDTO.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../widgets/legend_item.dart';
import '../widgets/pie_chart.dart';

class ProductStats extends StatelessWidget {
  final List<ProductDTO> plantedProducts;

  const ProductStats({super.key, required this.plantedProducts});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final Color textColor = dark ? TColors.white : TColors.black;

    final sections = _getProductPieChartSections();
    final legendItems = _getProductLegendItems();

    return Column(
      children: [
        const Divider(
          indent: TSizes.dividerIndent,
          endIndent: TSizes.dividerIndent,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              TTexts.totalProducts,
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              plantedProducts.length.toString(),
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
          chartName: TTexts.productDistribution,
          sections: sections,
          legendItems: legendItems,
        ),
      ],
    );
  }

  List<PieChartSectionData> _getProductPieChartSections() {
    if (plantedProducts.isEmpty) {
      return [];
    }

    Map<String, double> productDistribution = {};
    for (var product in plantedProducts) {
      String productName = product.productOptionDTO.name;
      productDistribution[productName] =
          (productDistribution[productName] ?? 0) + 1;
    }

    const colorList = TColors.dynamicPieChartColors;

    return productDistribution.entries.map((entry) {
      final index = productDistribution.keys.toList().indexOf(entry.key);
      final percentage = (entry.value / plantedProducts.length) * 100;

      return PieChartSectionData(
        value: percentage,
        showTitle: false,
        color: colorList[index % colorList.length], // Dynamic color assignment
        title: '${percentage.toStringAsFixed(1)}%',
      );
    }).toList();
  }

  List<LegendItem> _getProductLegendItems() {
    Map<String, double> productDistribution = {};
    for (var product in plantedProducts) {
      String productName =
          THelperFunctions.decodeUtf8(product.productOptionDTO.name);
      productDistribution[productName] =
          (productDistribution[productName] ?? 0) + 1;
    }

    const colorList = TColors.dynamicPieChartColors;

    return productDistribution.entries.map((entry) {
      final index = productDistribution.keys.toList().indexOf(entry.key);
      final percentage = (entry.value / plantedProducts.length) * 100;

      return LegendItem(
        color: colorList[index % colorList.length], // Dynamic color assignment
        productName: entry.key,
        percentage: '${percentage.toStringAsFixed(1)}%',
      );
    }).toList();
  }
}
