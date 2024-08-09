import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/tabbar.dart';
import 'package:toprak_rehberi/features/main_pages/products/widgets/harvested_products.dart';
import 'package:toprak_rehberi/features/main_pages/products/widgets/planted_products.dart';

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
                      Tab(
                        child: Text('Ekili Ürünler'),
                      ),
                      Tab(
                        child: Text('Hasat Edilmiş Ürünler'),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              SingleChildScrollView(
                child: TPlantedProducts(),
              ),
              SingleChildScrollView(
                child: THarvestedProducts(),
              ), // Placeholder for the second tab's content
            ],
          ),
        ),
      ),
    );
  }
}
