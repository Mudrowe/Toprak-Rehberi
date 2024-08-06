import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:toprak_rehberi/common/widgets/products/product_cards/product_card.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            TSearchContainer(
              text: 'Ürün ara',
            ),
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Padding(
              padding: EdgeInsets.only(left: TSizes.defaulSpace),
              child: Column(
                children: [
                  TProductCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
