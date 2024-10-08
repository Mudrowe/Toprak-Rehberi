import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/tabbar.dart';
import 'package:toprak_rehberi/features/main_pages/products/tabs/harvested_products.dart';
import 'package:toprak_rehberi/features/main_pages/products/tabs/planted_products.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';
import 'package:toprak_rehberi/dtos/ProductDTO.dart';

import '../../../service/fetching/product/fetch_products.dart';

class ProductsScreen extends StatefulWidget {
  final int initialTabIndex;
  const ProductsScreen({super.key, this.initialTabIndex = 0});

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late Future<List<ProductDTO>> _productsFuture;
  List<ProductDTO> _plantedProducts = [];
  List<ProductDTO> _harvestedProducts = [];

  @override
  void initState() {
    super.initState();
    _productsFuture = _fetchAndCategorizeProducts();
  }

  Future<List<ProductDTO>> _fetchAndCategorizeProducts() async {
    List<ProductDTO> products = await fetchProducts();

    // Categorize the products
    _plantedProducts =
        products.where((product) => !product.isHarvested).toList();
    _harvestedProducts =
        products.where((product) => product.isHarvested).toList();

    return products;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: DefaultTabController(
        length: 2,
        initialIndex: widget.initialTabIndex,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return const [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  flexibleSpace: FlexibleSpaceBar(
                    title: TTabBar(
                      tabs: [
                        Tab(child: Text(TTexts.plantedProducts)),
                        Tab(child: Text(TTexts.harvestedProducts)),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: FutureBuilder<List<ProductDTO>>(
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
                  return TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: TPlantedProducts(products: _plantedProducts),
                      ),
                      SingleChildScrollView(
                        child: THarvestedProducts(products: _harvestedProducts),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
