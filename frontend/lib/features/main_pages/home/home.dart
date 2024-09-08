import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:toprak_rehberi/features/main_pages/home/widgets/card_slider.dart';
import 'package:toprak_rehberi/features/main_pages/home/widgets/legend_item.dart';
import 'package:toprak_rehberi/features/main_pages/home/widgets/pie_chart.dart';
import 'package:toprak_rehberi/features/main_pages/home/widgets/product_card_home.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

import '../../../dtos/LandDTO.dart';
import '../../../dtos/ProductDTO.dart';
import '../../../dtos/UserDTO.dart';
import '../../../service/fetchings/pages/fetch_lands.dart';
import '../../../service/fetchings/pages/fetch_products.dart';
import '../../../service/fetchings/pages/fetch_user.dart';

// TODO: So, Stats are not compatible with products in the productsScreen

// ! FIX: There isn't any length check for legendItems.
// ! FIX: If there would be too many items, the screen will break

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<ProductDTO>> _products;
  late Future<List<LandDTO>> _lands;
  late Future<UserDTO> _user;

  @override
  void initState() {
    super.initState();
    _products = fetchProducts();
    _lands = fetchLands();
    _user = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final Color textColor = dark ? TColors.white : TColors.black;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: TSizes.spaceBtwSections),

            // User Information
            FutureBuilder<UserDTO>(
              future: _user,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final user = snapshot.data!;
                  return Text(
                    'Welcome, ${user.firstName} ${user.lastName}',
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  );
                } else {
                  return const Text('No user data available');
                }
              },
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            // Carousel Slider for Products
            FutureBuilder<List<ProductDTO>>(
              future: _products,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  List<TProductCardHome> cards = snapshot.data!.map((product) {
                    return TProductCardHome(productDTO: product);
                  }).toList();

                  return TCardSlider(cards: cards);
                } else {
                  return const Text('No products available');
                }
              },
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            // Lands Stats
            FutureBuilder<List<LandDTO>>(
              future: _lands,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final lands = snapshot.data!;
                  return Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            TTexts.totalLands,
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            '${lands.length}',
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),

                      /*
                      TPieChart(
                        chartName: TTexts.landDistribution,
                        sections: lands.map((land) {
                          return PieChartSectionData(
                            value: land.areaPercentage,
                            showTitle: false,
                            color: TColors.pieChartColor4,
                          );
                        }).toList(),
                        legendItems: lands.map((land) {
                          return LegendItem(
                            color: TColors.pieChartColor4,
                            productName: land.name,
                            percentage: '${land.areaPercentage}%',
                          );
                        }).toList(),
                      ),

                       */
                    ],
                  );
                } else {
                  return const Text('No lands available');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

