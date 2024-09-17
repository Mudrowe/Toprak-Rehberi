import 'package:flutter/material.dart';
import 'package:toprak_rehberi/features/main_pages/home/sections/land_stats.dart';
import 'package:toprak_rehberi/features/main_pages/home/sections/product_stats.dart';
import 'package:toprak_rehberi/features/main_pages/home/widgets/card_slider.dart';
import 'package:toprak_rehberi/features/main_pages/home/widgets/product_card_home.dart';
import 'package:toprak_rehberi/service/fetching/pages/fetch_user.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
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

  @override
  Widget build(BuildContext context) {
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

                  // Carousel Slider and Stats for Products
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

                        return Column(
                          children: [
                            // Slider
                            TCardSlider(cards: cards),

                            const SizedBox(height: TSizes.spaceBtwItems),

                            // Stats
                            ProductStats(plantedProducts: _plantedProducts),
                          ],
                        );
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
