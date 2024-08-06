import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            TSearchContainer(
              text: 'Ürün ara',
            ),
          ],
        ),
      ),
    );
  }
}
