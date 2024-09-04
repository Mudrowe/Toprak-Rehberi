import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toprak_rehberi/dtos/LandDTO.dart';
import 'package:toprak_rehberi/service/fetchings/fetch_cities.dart';
import 'package:toprak_rehberi/service/fetchings/fetch_districts.dart';
import 'package:toprak_rehberi/service/fetchings/fetch_land_types.dart';
import 'package:toprak_rehberi/service/fetchings/fetch_neighborhoods.dart';
import 'package:toprak_rehberi/service/land/add_land.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

import '../../../../../dtos/CityDTO.dart';
import '../../../../../dtos/DistrictDTO.dart';
import '../../../../../dtos/LandTypeDTO.dart';
import '../../../../../dtos/NeighborhoodDTO.dart';

// ! Change the color theme of DropdownButtonFormField

class TAddLandForm extends StatefulWidget {
  const TAddLandForm({super.key});

  @override
  State<TAddLandForm> createState() => _TAddLandFormState();
}

class _TAddLandFormState extends State<TAddLandForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _fieldName;
  LandTypeDTO? _landType;
  CityDTO? _city;
  DistrictDTO? _district;
  NeighborhoodDTO? _neighborhood;
  double? _size;
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
      setState(() {
        _cities = cities;
        _landTypes = landTypes;
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load initial data: $error')),
      );
    }
  }

  void _loadDistricts(int cityId) async {
    try {
      List<DistrictDTO> districts = await fetchDistricts(cityId);
      setState(() {
        _districts = districts;
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load districts: $error')),
      );
    }
  }

  void _loadNeighborhoods(int districtId) async {
    try {
      List<NeighborhoodDTO> neighborhoods =
          await fetchNeighborhoods(districtId);
      setState(() {
        _neighborhoods = neighborhoods;
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load neighborhoods: $error')),
      );
    }
  }

  void _onCityChanged(CityDTO? selectedCity) async {
    setState(() {
      _city = selectedCity;
      _districts = [];
      _neighborhoods = [];
      _district = null;
      _neighborhood = null;
    });
    if (selectedCity != null) {
      _districts = await fetchDistricts(selectedCity.id);
      setState(() {});
    }
  }

  void _onDistrictChanged(DistrictDTO? selectedDistrict) async {
    setState(() {
      _district = selectedDistrict;
      _neighborhoods = [];
      _neighborhood = null;
    });
    if (selectedDistrict != null) {
      _neighborhoods = await fetchNeighborhoods(selectedDistrict.id);
      setState(() {});
    }
  }

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
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Land created successfully!')));
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to create land.')));
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
            },
            onSaved: (LandTypeDTO? value) {
              _landType = value;
            },
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // City & District
          Row(
            children: [
              // City
              Expanded(
                child: DropdownButtonFormField<CityDTO>(
                  hint: const Text(TTexts.city),
                  items: _cities.map((CityDTO city) {
                    return DropdownMenuItem<CityDTO>(
                      value: city,
                      child: Text(utf8.decode(city.name.codeUnits)),
                    );
                  }).toList(),
                  onChanged: (CityDTO? newValue) {
                    setState(() {
                      _city = newValue;
                      _district = null;
                      _neighborhood = null;
                      _districts = [];
                      _neighborhoods = [];
                    });
                    if (newValue != null) {
                      _loadDistricts(newValue.id);
                    }
                  },
                  onSaved: (CityDTO? value) {
                    _city = value;
                  },
                ),
              ),

              const SizedBox(width: TSizes.spaceBtwItems),

              // District
              Expanded(
                child: DropdownButtonFormField<DistrictDTO>(
                  hint: const Text(TTexts.district),
                  items: _districts.map((DistrictDTO district) {
                    return DropdownMenuItem<DistrictDTO>(
                      value: district,
                      child: Text(utf8.decode(district.name.codeUnits)),
                    );
                  }).toList(),
                  onChanged: (DistrictDTO? newValue) {
                    setState(() {
                      _district = newValue;
                      _neighborhood = null;
                      _neighborhoods = [];
                    });
                    if (newValue != null) {
                      _loadNeighborhoods(newValue.id);
                    }
                  },
                  onSaved: (DistrictDTO? value) {
                    _district = value;
                  },
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
                child: DropdownButtonFormField<NeighborhoodDTO>(
                  hint: const Text(TTexts.neighborhood),
                  items: _neighborhoods.map((NeighborhoodDTO neighborhood) {
                    return DropdownMenuItem<NeighborhoodDTO>(
                      value: neighborhood,
                      child: Text(utf8.decode(neighborhood.name.codeUnits)),
                    );
                  }).toList(),
                  onChanged: (NeighborhoodDTO? newValue) {
                    setState(() {
                      _neighborhood = newValue;
                    });
                  },
                  onSaved: (NeighborhoodDTO? value) {
                    _neighborhood = value;
                  },
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
                    _size = double.tryParse(value ?? '');
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
