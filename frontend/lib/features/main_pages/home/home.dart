import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:toprak_rehberi/features/main_pages/home/sections/land_stats.dart';
import 'package:toprak_rehberi/features/main_pages/home/sections/product_stats.dart';
import 'package:toprak_rehberi/features/main_pages/home/widgets/card_slider.dart';
import 'package:toprak_rehberi/features/main_pages/home/widgets/legend_item.dart';
import 'package:toprak_rehberi/features/main_pages/home/widgets/pie_chart.dart';
import 'package:toprak_rehberi/features/main_pages/home/widgets/product_card_home.dart';
import 'package:toprak_rehberi/service/fetching/pages/fetch_user.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

import '../../../dtos/LandDTO.dart';
import '../../../dtos/ProductDTO.dart';
import '../../../dtos/UserDTO.dart';
import '../../../service/fetching/pages/fetch_lands.dart';
import '../../../service/fetching/product/fetch_products.dart';

// TODO: So, Stats are not compatible with products in the productsScreen

// ! FIX: There isn't any length check for legendItems.
// ! FIX: If there would be too many items, the screen will break

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<UserDTO> _user;
  late Future<List<ProductDTO>> _productsFuture;
  late Future<List<LandDTO>> _lands;
  List<ProductDTO> _plantedProducts = [];

  @override
  void initState() {
    super.initState();
    _user = fetchUser();
    _productsFuture = _fetchAndCategorizeProducts();
  }

  Future<List<ProductDTO>> _fetchAndCategorizeProducts() async {
    List<ProductDTO> products = await fetchProducts();

    // Not harvested products
    _plantedProducts =
        products.where((product) => !product.isHarvested).toList();

    return _plantedProducts;
  }

  List<PieChartSectionData> _getProductPieChartSections() {
    if (_plantedProducts.isEmpty) {
      return [];
    }

    Map<String, double> productDistribution = {};
    for (var product in _plantedProducts) {
      String productName = product.productOptionDTO.name;
      productDistribution[productName] = (productDistribution[productName] ?? 0) + 1;
    }

    return productDistribution.entries.map((entry) {
      final percentage = (entry.value / _plantedProducts.length) * 100;
      return PieChartSectionData(
        value: percentage,
        showTitle: false,
        color: TColors.primaryColor,
        title: '${percentage.toStringAsFixed(1)}%',
      );
    }).toList();
  }

  List<LegendItem> _getProductLegendItems() {
    Map<String, double> productDistribution = {};
    for (var product in _plantedProducts) {
      String productName = product.productOptionDTO.name;
      productDistribution[productName] = (productDistribution[productName] ?? 0) + 1;
    }

    return productDistribution.entries.map((entry) {
      final percentage = (entry.value / _plantedProducts.length) * 100;
      return LegendItem(
        color: TColors.primaryColor,
        productName: entry.key,
        percentage: '${percentage.toStringAsFixed(1)}%',
      );
    }).toList();
  }


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final Color textColor = dark ? TColors.white : TColors.black;

    return Scaffold(
      body: FutureBuilder<UserDTO>(
        future: _user,
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (userSnapshot.hasError) {
            return Text('Error: ${userSnapshot.error}');
          } else if (userSnapshot.hasData) {
            UserDTO user = userSnapshot.data!;

            _lands = fetchLandsByUserId(user.id!);

            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Carousel Slider for Products
                  FutureBuilder<List<ProductDTO>>(
                    future: _productsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        List<TProductCardHome> cards =
                            _plantedProducts.map((product) {
                          return TProductCardHome(productDTO: product);
                        }).toList();

                        return TCardSlider(cards: cards);
                      } else {
                        return const Text('No products available');
                      }
                    },
                  ),

                  const SizedBox(height: TSizes.spaceBtwItems),

                  ProductStats(plantedProducts: _plantedProducts),

                  // Lands Stats
                  FutureBuilder<List<LandDTO>>(
                    future: _lands,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('ErrorS: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        return LandStats(lands: snapshot.data!);
                      } else {
                        return const Text('No lands available');
                      }
                    },
                  ),
                ],
              ),
            );
          } else {
            return const Text('User data is not available');
          }
        },
      ),
    );
  }
}
