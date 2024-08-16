import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/tabbar.dart';
import 'package:toprak_rehberi/features/main_pages/products/tabs/harvested_products.dart';
import 'package:toprak_rehberi/features/main_pages/products/tabs/planted_products.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
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
          body: const TabBarView(
            children: [
              SingleChildScrollView(child: TPlantedProducts()),
              SingleChildScrollView(child: THarvestedProducts()),
            ],
          ),
        ),
      ),
    );
  }
}
