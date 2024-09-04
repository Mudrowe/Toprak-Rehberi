import 'package:flutter/material.dart';
import 'package:toprak_rehberi/dtos/LandDTO.dart';
import 'package:toprak_rehberi/service/land/add_land.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

import '../../../../../dtos/LandTypeDTO.dart';
import '../../../../../dtos/NeighborhoodDTO.dart';

// ! Change the color theme of DropdownButtonFormField

class TAddLandForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _fieldName;
  LandTypeDTO? _landType;
  String? _city;
  String? _district;
  NeighborhoodDTO? _neighborhood;
  double? _size;
  String? _parcelNo;
  String? _adaNo;

  TAddLandForm({super.key});

  void _saveForm(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      LandDTO land = LandDTO(
        name: _fieldName!,
        neighborhoodId: _neighborhood?.id,
        parcelNo: _parcelNo!,
        adaNo: _adaNo!,
        size: _size!,
        landTypeId: _landType?.id,
      );

      addLand(land).then((_) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Land created succesffully!')));
      }).catchError((error) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to create land.')));
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

          // Land Name
          TextFormField(
            decoration: const InputDecoration(labelText: TTexts.landName),
            onSaved: (String? value) {
              _fieldName = value;
            },
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // Land Type
          DropdownButtonFormField(
            hint: const Text(TTexts.landType),
            items: const [
              DropdownMenuItem(
                value: 'Tarla',
                child: Text('Tarla'),
              ),
              DropdownMenuItem(
                value: 'Bağ',
                child: Text('Bağ'),
              ),
              DropdownMenuItem(
                value: 'Bahçe',
                child: Text('Bahçe'),
              ),
            ],
            onSaved: (String? value) {
              _landType = value as LandTypeDTO;
            },
            onChanged: (value) {},
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // City & District
          Row(
            children: [

              // City
              Expanded(
                child: DropdownButtonFormField(
                  hint: const Text(TTexts.city),
                  items: const [
                    DropdownMenuItem(
                      value: 'Ankara',
                      child: Text('Ankara'),
                    ),
                    DropdownMenuItem(
                      value: 'İstanbul',
                      child: Text('İstanbul'),
                    ),
                    DropdownMenuItem(
                      value: 'İzmir',
                      child: Text('İzmir'),
                    ),
                  ],
                  onSaved: (String? value) {
                    _city = value;
                  },
                  onChanged: (value) {},
                ),
              ),

              const SizedBox(width: TSizes.spaceBtwItems),

              // District
              Expanded(
                child: DropdownButtonFormField(
                  hint: const Text(TTexts.district),
                  items: const [
                    DropdownMenuItem(
                      value: 'İlçe 1',
                      child: Text('İlçe 1'),
                    ),
                    DropdownMenuItem(
                      value: 'İlçe 2',
                      child: Text('İlçe 2'),
                    ),
                    DropdownMenuItem(
                      value: 'İlçe 3',
                      child: Text('İlçe 3'),
                    ),
                  ],
                  onSaved: (String? value) {
                    _district = value;
                  },
                  onChanged: (value) {},
                ),
              ),
            ],
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // Neighborhood & Area
          Row(
            children: [

              // Neighborhood
              Expanded(
                child: DropdownButtonFormField(
                  hint: const Text(TTexts.neighborhood),
                  items: const [
                    DropdownMenuItem(
                      value: 'Köy 1',
                      child: Text('Köy 1'),
                    ),
                    DropdownMenuItem(
                      value: 'Köy 2',
                      child: Text('Köy 2'),
                    ),
                    DropdownMenuItem(
                      value: 'Köy 3',
                      child: Text('Köy 3'),
                    ),
                  ],
                  onSaved: (String? value) {
                    _neighborhood?.id = value as int;
                  },
                  onChanged: (value) {},
                ),
              ),

              const SizedBox(width: TSizes.spaceBtwItems),

              // Size
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: '${TTexts.size} (${TTexts.squareSymbol})',
                  ),
                  onSaved: (String? value) {
                    _size = value as double;
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // Parcel No & Ada No
          Row(
            children: [

              // Parcel No
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: TTexts.parcelNo),
                  onSaved: (String? value) {
                    _parcelNo = value;
                  },
                ),
              ),

              const SizedBox(width: TSizes.spaceBtwItems),

              // Ada No
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: TTexts.adaNo),
                  onSaved: (String? value) {
                    _adaNo = value;
                  },
                ),
              ),
            ],
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
