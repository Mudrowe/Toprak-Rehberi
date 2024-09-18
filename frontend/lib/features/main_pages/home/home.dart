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
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../lands/land_details/add_product_screen/widgets/no_data_column.dart';

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
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
            );
          } else if (userSnapshot.hasError) {
            return Text('Error: ${userSnapshot.error}');
          } else if (userSnapshot.hasData) {
            UserDTO user = userSnapshot.data!;

            _lands = fetchLandsByUserId(user.id!);

            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: TSizes.spaceBtwSections * 1.5 ),

                  // Carousel Slider and Stats for Products
                  _buildProductSection(),

                  const SizedBox(height: TSizes.spaceBtwItems),

                  // Lands Stats
                  _buildLandSection(),
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

  Widget _buildProductSection() {
    final dark = THelperFunctions.isDarkMode(context);
    final Color textColor = dark ? TColors.white : TColors.black;
    return FutureBuilder<List<ProductDTO>>(
      future: _productsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          List<TProductCardHome> cards = _plantedProducts.map((product) {
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
          return Center(
            child: Column(
              children: [
                buildNoDataColumn(TTexts.totalProducts, 0, textColor),
                Image.asset(dark ? TImages.darkAppLogo : TImages.lightAppLogo),
                SizedBox(height: THelperFunctions.screenWidth() / 2.3),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildLandSection() {
    final dark = THelperFunctions.isDarkMode(context);
    final Color textColor = dark ? TColors.white : TColors.black;
    return FutureBuilder<List<LandDTO>>(
      future: _lands,
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
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return LandStats(lands: snapshot.data!);
        } else {
          return Center(
            child: Column(
              children: [
                buildNoDataColumn(TTexts.totalLands, 0, textColor),
                Image.asset(dark ? TImages.darkAppLogo : TImages.lightAppLogo),
              ],
            ),
          );
        }
      },
    );
  }



}
