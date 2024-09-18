import 'package:flutter/material.dart';
import 'package:toprak_rehberi/dtos/LandDTO.dart';
import 'package:toprak_rehberi/features/main_pages/products/widgets/product_card/product_card.dart';
import 'package:toprak_rehberi/utils/constants/image_strings.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

import '../../../../../../common/widgets/appbar/tabbar.dart';
import '../../../../../../dtos/ProductDTO.dart';
import '../../../../../../service/fetching/product/fetch_products.dart';

class TLandProducts extends StatefulWidget {
  final LandDTO landDTO;

  const TLandProducts({super.key, required this.landDTO});

  @override
  _TLandProductsState createState() => _TLandProductsState();
}

class _TLandProductsState extends State<TLandProducts>
    with SingleTickerProviderStateMixin {
  late Future<List<ProductDTO>> _productsFuture;
  List<ProductDTO> _plantedProducts = [];
  List<ProductDTO> _harvestedProducts = [];

  @override
  void initState() {
    super.initState();
    _productsFuture = _fetchAndCategorizeProducts();
  }

  Future<List<ProductDTO>> _fetchAndCategorizeProducts() async {
    List<ProductDTO> products = await fetchProductsByLandId(widget.landDTO.id!);

    _plantedProducts =
        products.where((product) => !product.isHarvested).toList();
    _harvestedProducts =
        products.where((product) => product.isHarvested).toList();

    return products;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductDTO>>(
      future: _productsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColor,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return DefaultTabController(
            length: 2,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const TTabBar(
                    tabs: [
                      Tab(child: Text(TTexts.plantedProducts)),
                      Tab(child: Text(TTexts.harvestedProducts)),
                    ],
                  ),
                  SizedBox(
                    height: THelperFunctions.screenHeight(),
                    child: TabBarView(
                      children: [
                        _buildProductList(_plantedProducts),
                        _buildProductList(_harvestedProducts),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildProductList(List<ProductDTO> products) {
    final dark = THelperFunctions.isDarkMode(context);
    return products.isEmpty
        ? Column(
            children: [
              const SizedBox(height: TSizes.spaceBtwItems),
              Image.asset(dark ? TImages.darkAppLogo : TImages.lightAppLogo),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Text(
                TTexts.noProducts,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: TSizes.spaceBtwItems),
                for (var product in products)
                  Column(
                    children: [
                      TProductCard(productDTO: product),
                      const SizedBox(height: TSizes.spaceBtwItems),
                    ],
                  ),
              ],
            ),
          );
  }
}
