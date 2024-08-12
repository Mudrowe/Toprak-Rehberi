import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/models/product/product.dart';

class TProductDetails extends StatelessWidget {
  final Product product;
  
  const TProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(),
      body: Column(
        children: [
          Center(child: Text('Patates')),
        ],
      ),
    );
  }
}
