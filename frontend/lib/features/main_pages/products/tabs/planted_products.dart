import 'package:flutter/material.dart';
import 'package:toprak_rehberi/features/main_pages/products/tabs/products_page.dart';

import '../../../../dtos/ProductDTO.dart';
import '../../../../utils/constants/text_strings.dart';

class TPlantedProducts extends StatelessWidget {
  final List<ProductDTO> products;

  const TPlantedProducts({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return TProductsList(
      products: products,
      emptyMessage: 'Ekili ürün yok',
      totalProductsText: TTexts.totalPlantedProducts,
    );
  }
}
