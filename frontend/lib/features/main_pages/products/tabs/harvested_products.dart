import 'package:flutter/material.dart';
import 'package:toprak_rehberi/features/main_pages/products/tabs/products_page.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

import '../../../../dtos/ProductDTO.dart';

class THarvestedProducts extends StatelessWidget {
  final List<ProductDTO> products;

  const THarvestedProducts({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return TProductsList(
      products: products,
      emptyMessage: 'Hasat edilmiş ürün yok',
      totalProductsText: TTexts.totalHarvestedProducts,
    );
  }
}
