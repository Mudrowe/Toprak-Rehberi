import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toprak_rehberi/dtos/LandDTO.dart';
import 'package:toprak_rehberi/service/fetching/constants/fetch_cities.dart';
import 'package:toprak_rehberi/service/fetching/constants/fetch_districts.dart';
import 'package:toprak_rehberi/service/fetching/constants/fetch_neighborhoods.dart';
import 'package:toprak_rehberi/service/land/add_land.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

import '../../../../../dtos/location/CityDTO.dart';
import '../../../../../dtos/LandTypeDTO.dart';
import '../../../../../dtos/location/DistrictDTO.dart';
import '../../../../../dtos/location/NeighborhoodDTO.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../service/fetching/constants/fetch_land_types.dart';

class TAddLandForm extends StatefulWidget {
  const TAddLandForm({super.key});

  @override
  State<TAddLandForm> createState() => _TAddLandFormState();
}

class _TAddLandFormState extends State<TAddLandForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _fieldName;
  LandTypeDTO? _landType;
  NeighborhoodDTO? _neighborhood;
  double? _area;
  String? _parcelNo;
  String? _adaNo;

  List<CityDTO> _cities = [];
  List<DistrictDTO> _districts = [];
  List<NeighborhoodDTO> _neighborhoods = [];
  List<LandTypeDTO> _landTypes = [];

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  void _loadInitialData() async {
    try {
      List<CityDTO> cities = await fetchCities();
      List<LandTypeDTO> landTypes = await fetchLandTypes();
      if (mounted) {
        setState(() {
          _cities = cities;
          _landTypes = landTypes;
        });
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load initial data: $error')),
        );
      }
    }
  }

  void _onCityChanged(CityDTO? selectedCity) async {
    setState(() {
      _districts = [];
      _neighborhoods = [];
      _neighborhood = null;
    });
    if (selectedCity != null) {
      try {
        List<DistrictDTO> districts = await fetchDistricts(selectedCity.id);
        if (mounted) {
          setState(() {
            _districts = districts;
          });
        }
      } catch (error) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to load districts: $error')),
          );
        }
      }
    }
  }

  void _onDistrictChanged(DistrictDTO? selectedDistrict) async {
    setState(() {
      _neighborhoods = [];
      _neighborhood = null;
    });
    if (selectedDistrict != null) {
      try {
        List<NeighborhoodDTO> neighborhoods =
            await fetchNeighborhoods(selectedDistrict.id);
        if (mounted) {
          setState(() {
            _neighborhoods = neighborhoods;
          });
        }
      } catch (error) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to load neighborhoods: $error')),
          );
        }
      }
    }
  }

  void _saveForm(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      print("Selected LandType ID: ${_landType?.id}");

      LandDTO land = LandDTO(
        name: _fieldName!,
        neighborhoodDTO: _neighborhood!,
        parcelNo: _parcelNo!,
        adaNo: _adaNo!,
        area: _area!,
        landTypeDTO: _landType!,
      );

      try {
        await addLand(land);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Arazi başarıyla kaydedildi!')),
          );
        }
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const NavigationMenu(
              initialIndex: 1,
            ),
          ),
          (Route<dynamic> route) => false,
        );
      } catch (error) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Arazi kaydedilemedi.')),
          );
        }
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

          // Land Name
          TextFormField(
            decoration: const InputDecoration(labelText: TTexts.landName),
            onSaved: (String? value) {
              _fieldName = value;
            },
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // Land Type
          DropdownButtonFormField<LandTypeDTO>(
            hint: const Text(TTexts.landType),
            items: _landTypes.map((LandTypeDTO landType) {
              return DropdownMenuItem<LandTypeDTO>(
                value: landType,
                child: Text(utf8.decode(landType.name.codeUnits)),
              );
            }).toList(),
            onChanged: (LandTypeDTO? value) {
              setState(() {
                _landType = value;
              });
              print("Selected LandType: ${_landType?.name}");
            },
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // City
          DropdownButtonFormField<CityDTO>(
            hint: const Text(TTexts.city),
            items: _cities.map((CityDTO city) {
              return DropdownMenuItem<CityDTO>(
                value: city,
                child: Text(
                  THelperFunctions.decodeUtf8(city.name),
                ),
              );
            }).toList(),
            onChanged: (CityDTO? newValue) {
              _onCityChanged(newValue);
            },
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // District
          DropdownButtonFormField<DistrictDTO>(
            hint: const Text(TTexts.district),
            items: _districts.map((DistrictDTO district) {
              return DropdownMenuItem<DistrictDTO>(
                value: district,
                child: Text(
                  THelperFunctions.decodeUtf8(district.name),
                ),
              );
            }).toList(),
            onChanged: (DistrictDTO? newValue) {
              _onDistrictChanged(newValue);
            },
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // Neighborhood
          DropdownButtonFormField<NeighborhoodDTO>(
            hint: const Text(TTexts.neighborhood),
            items: _neighborhoods.map((NeighborhoodDTO neighborhood) {
              return DropdownMenuItem<NeighborhoodDTO>(
                value: neighborhood,
                child: Text(
                  THelperFunctions.decodeUtf8(neighborhood.name),
                ),
              );
            }).toList(),
            onChanged: (NeighborhoodDTO? newValue) {
              setState(() {
                _neighborhood = newValue;
              });
            },
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // Size
          TextFormField(
            decoration: const InputDecoration(
              labelText: '${TTexts.area} (${TTexts.squareSymbol})',
            ),
            keyboardType: TextInputType.number,
            onSaved: (String? value) {
              _area = double.tryParse(value ?? '');
            },
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // Parcel No
          TextFormField(
            decoration: const InputDecoration(labelText: TTexts.parcelNo),
            keyboardType: TextInputType.number,
            onSaved: (String? value) {
              _parcelNo = value;
            },
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // Ada No
          TextFormField(
            decoration: const InputDecoration(labelText: TTexts.adaNo),
            keyboardType: TextInputType.number,
            onSaved: (String? value) {
              _adaNo = value;
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
