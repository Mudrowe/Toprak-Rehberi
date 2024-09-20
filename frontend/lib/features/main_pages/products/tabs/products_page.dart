import 'package:flutter/material.dart';
import '../../../../common/widgets/custom_shapes/search_container.dart';
import '../../../../dtos/ProductDTO.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../widgets/product_card/product_card.dart';
import '../../../../utils/constants/sizes.dart';

class TProductsList extends StatefulWidget {
  final List<ProductDTO> products;
  final String emptyMessage;
  final String totalProductsText;

  const TProductsList({
    super.key,
    required this.products,
    required this.emptyMessage,
    required this.totalProductsText,
  });

  @override
  _TProductsListState createState() => _TProductsListState();
}

class _TProductsListState extends State<TProductsList> {
  List<ProductDTO> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = widget.products;
  }

  void _onSearchChanged(String query) {
    setState(() {
      filteredProducts = widget.products
          .where((product) => THelperFunctions.decodeUtf8(product.productOptionDTO.name)
          .toLowerCase()
          .contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        const SizedBox(height: TSizes.spaceBtwItems),
        TSearchContainer(
          onSearchChanged: _onSearchChanged,
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        if (filteredProducts.isEmpty)
          Column(
            children: [
              Image.asset(dark ? TImages.darkAppLogo : TImages.lightAppLogo),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                widget.emptyMessage,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )
        else
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(widget.totalProductsText),
                    Text('${filteredProducts.length}'),
                  ],
                ),
                const Divider(
                  indent: TSizes.dividerIndent,
                  endIndent: TSizes.dividerIndent,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                for (var productDTO in filteredProducts)
                  Column(
                    children: [
                      TProductCard(productDTO: productDTO),
                      const SizedBox(height: TSizes.spaceBtwItems),
                    ],
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
