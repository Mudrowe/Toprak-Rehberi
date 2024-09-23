import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toprak_rehberi/dtos/ProductDTO.dart';
import 'package:toprak_rehberi/features/main_pages/lands/land_details/add_product_screen/widgets/select_product_dropdown_menu.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

import '../../../../../../dtos/LandDTO.dart';
import '../../../../../../dtos/ProductOptionDTO.dart';
import '../../../../../../navigation_menu.dart';
import '../../../../../../service/fetching/product/fetch_product_options.dart';
import '../../../../../../service/product/add_product.dart';
import '../../../../../../models/suggestion_product.dart';
import '../../../../../../service/suggestion/suggestion.dart';

class TAddProductForm extends StatefulWidget {
  final LandDTO landDTO;

  const TAddProductForm({super.key, required this.landDTO});

  @override
  State<TAddProductForm> createState() => _TAddProductFormState();
}

class _TAddProductFormState extends State<TAddProductForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double? _area;
  DateTime? _plantingDate;
  double? _score;
  ProductOptionDTO? _productOptionDTO;
  List<SuggestionProduct> _suggestions = [];

  @override
  void initState() {
    super.initState();
    _plantingDate = DateTime.now();
    _fetchSuggestions(widget.landDTO.id!);
  }

  Future<void> _fetchSuggestions(int landId) async {
    try {
      final fetchedSuggestions = await fetchSuggestions(landId);
      setState(() {
        _suggestions = fetchedSuggestions;
      });
    } catch (error) {
      print('Error fetching suggestions: $error');
    }
  }

  Future<void> _fetchProductOption(int productOptionId) async {
    try {
      final fetchedProductOption = await fetchProductOptionById(productOptionId);
      setState(() {
        _productOptionDTO = fetchedProductOption;
      });
    } catch (error) {
      print('Error fetching product option: $error');
    }
  }

  void _handleProductChange(int? id) {
    if (id != null) {
      _fetchProductOption(id);
    }
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

  DateTime addMinutes(DateTime date, int minutes) {
    return date.add(Duration(minutes: minutes));
  }

  Future<void> _saveForm(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      if (_area == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Lütfen eklemek istediğiniz alanı girin.')),
        );
        return;
      } else if (_productOptionDTO == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Lütfen eklemek istediğiniz ürünü seçin.')),
        );
        return;
      }

      ProductDTO productDTO = ProductDTO(
        land: LandDTO(
          id: widget.landDTO.id,
          name: widget.landDTO.name,
          area: widget.landDTO.area,
          adaNo: widget.landDTO.adaNo,
          parcelNo: widget.landDTO.parcelNo,
          landTypeDTO: widget.landDTO.landTypeDTO,
          neighborhoodDTO: widget.landDTO.neighborhoodDTO,
        ),
        area: _area!,
        productOptionDTO: _productOptionDTO!,
        plantingDate: _plantingDate,
        harvestDate: addMonths(_plantingDate!, _productOptionDTO?.plantingDuration ?? 0),
        score: _score,
        isHarvested: false,
      );

      print('Sending ProductDTO JSON 1: ${jsonEncode(productDTO.toJson())}');
      try {
        await addProduct(productDTO);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ürün başarıyla eklendi!')),
        );

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const NavigationMenu(
              initialIndex: 3,
            ),
          ),
              (Route<dynamic> route) => false,
        );
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ürün eklenemedi.')),
        );
      }
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
            suggestions: _suggestions,
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
