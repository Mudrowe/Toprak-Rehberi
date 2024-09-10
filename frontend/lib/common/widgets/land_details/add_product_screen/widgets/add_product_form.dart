import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/land_details/add_product_screen/widgets/select_product_dropdown_menu.dart';
import 'package:toprak_rehberi/dtos/ProductDTO.dart';
import 'package:toprak_rehberi/service/fetching/pages/fetch_lands.dart';
import 'package:toprak_rehberi/service/fetching/product/fetch_product_options.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

import '../../../../../models/land.dart';
import '../../../../../models/product_option.dart';
import '../../../../../service/product/add_product.dart';

class TAddProductForm extends StatefulWidget {
  final Land land;

  const TAddProductForm({super.key, required this.land});

  @override
  State<TAddProductForm> createState() => _TAddProductFormState();
}

class _TAddProductFormState extends State<TAddProductForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double? _area;
  int? _productOptionId;
  DateTime? _plantingDate;
  double? _score;
  ProductOption? _productOption;

  @override
  void initState() {
    _plantingDate = DateTime.now();
    super.initState();
  }

  Future<void> _fetchProductOption(int id) async {
    try {
      final fetchedProductOption = await fetchProductOptionById(id);
      setState(() {
        _productOption = fetchedProductOption;
      });
    } catch (error) {
      print('Error fetching product option: $error');
    }
  }


  void _handleProductChange(int? id) {
    if (id != null) {
      _fetchProductOption(id);
    }
    setState(() {
      _productOptionId = id;
    });
  }

  DateTime addMonths(DateTime date, int months) {
    int newMonth = date.month + months;
    int yearsToAdd = (newMonth - 1) ~/ 12;
    newMonth = (newMonth - 1) % 12 + 1;

    return DateTime(
      date.year + yearsToAdd,
      newMonth,
      date.day,
    );
  }

  Future<void> _saveForm(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      if (_area == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Lütfen eklemek istediğiniz alanı girin.')),
        );
        return;
      } else if (_productOptionId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Lütfen eklemek istediğiniz ürünü seçin.')),
        );
        return;
      }

      ProductDTO productDTO = ProductDTO(
        landId: (await fetchLandByName(widget.land.landName)).id,
        area: _area!,
        productOptionId: _productOptionId!,
        landName: widget.land.landName,
        plantingDate: _plantingDate,
        harvestDate: addMonths(_plantingDate!, _productOption?.plantingDuration ?? 0),
        imageUrl: _productOption?.imageUrl,
        productName: _productOption?.name,
        score: _score,
      );

      print('Sending ProductDTO JSON 1: ${jsonEncode(productDTO.toJson())}');
      addProduct(productDTO).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ürün başarıyla eklendi!')),
        );
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ürün eklenemedi.')),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: TSizes.appBarHeight),

          TSelectProductDropdownMenu(
            onChanged: _handleProductChange,
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // Area
          TextFormField(
            decoration: const InputDecoration(
              labelText: '${TTexts.productArea} (${TTexts.squareSymbol})',
            ),
            keyboardType: TextInputType.number,
            onSaved: (String? value) {
              _area = double.tryParse(value ?? '');
            },
          ),

          const SizedBox(height: TSizes.spaceBtwSections),

          // Confirm Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _saveForm(context),
              child: const Text(TTexts.submit),
            ),
          ),
        ],
      ),
    );
  }
}
