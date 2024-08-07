import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/tabbar.dart';
import 'package:toprak_rehberi/features/main_pages/products/widgets/planted_products.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        //appBar: TAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TTabBar(tabs: [
                Tab(
                  child: Text(
                    'Ekili Ürünler',
                  ),
                ),
                Tab(
                  child: Text('Hasat Edilmiş Ürünler'),
                )
              ]),
              
              TPlantedProducts(),
            ],
          ),
        ),
      ),
    );
  }
}

