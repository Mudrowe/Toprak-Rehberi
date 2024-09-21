import 'package:flutter/material.dart';
import 'package:toprak_rehberi/service/fetching/constants/fetch_cities.dart';
import 'package:toprak_rehberi/service/fetching/constants/fetch_districts.dart';
import 'package:toprak_rehberi/service/fetching/constants/fetch_neighborhoods.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';
import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/custom_shapes/custom_elevated_button.dart';
import '../../../dtos/location/CityDTO.dart';
import '../../../dtos/location/DistrictDTO.dart';
import '../../../dtos/location/NeighborhoodDTO.dart';
import '../../../utils/constants/colors.dart';

class ToprakRehberi extends StatefulWidget {
  const ToprakRehberi({super.key});

  @override
  State<ToprakRehberi> createState() => _ToprakRehberiState();
}

class _ToprakRehberiState extends State<ToprakRehberi> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CityDTO? _selectedCity;
  DistrictDTO? _selectedDistrict;
  NeighborhoodDTO? _selectedNeighborhood;

  List<CityDTO> _cities = [];
  List<DistrictDTO> _districts = [];
  List<NeighborhoodDTO> _neighborhoods = [];

  @override
  void initState() {
    super.initState();
    _loadCities();
  }

  void _loadCities() async {
    try {
      List<CityDTO> cities = await fetchCities();
      setState(() {
        _cities = cities;
      });
    } catch (error) {
      _showErrorSnackbar('Failed to load cities: $error');
    }
  }

  void _onCityChanged(CityDTO? selectedCity) async {
    setState(() {
      _selectedDistrict = null;
      _selectedNeighborhood = null;
      _districts = [];
      _neighborhoods = [];
    });

    if (selectedCity != null) {
      try {
        List<DistrictDTO> districts = await fetchDistricts(selectedCity.id);
        setState(() {
          _districts = districts;
        });
      } catch (error) {
        _showErrorSnackbar('Failed to load districts: $error');
      }
    }
  }

  void _onDistrictChanged(DistrictDTO? selectedDistrict) async {
    setState(() {
      _selectedNeighborhood = null;
      _neighborhoods = [];
    });

    if (selectedDistrict != null) {
      try {
        List<NeighborhoodDTO> neighborhoods =
            await fetchNeighborhoods(selectedDistrict.id);
        setState(() {
          _neighborhoods = neighborhoods;
        });
      } catch (error) {
        _showErrorSnackbar('Failed to load neighborhoods: $error');
      }
    }
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _fetchSuggestions() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(TSizes.lg),
          child: Column(
            children: [
              // City Dropdown
              DropdownButtonFormField<CityDTO>(
                hint: const Text(TTexts.city),
                items: _cities.map((city) {
                  return DropdownMenuItem<CityDTO>(
                    value: city,
                    child: Text(THelperFunctions.decodeUtf8(city.name)),
                  );
                }).toList(),
                onChanged: _onCityChanged,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // District Dropdown
              DropdownButtonFormField<DistrictDTO>(
                hint: const Text(TTexts.district),
                items: _districts.map((district) {
                  return DropdownMenuItem<DistrictDTO>(
                    value: district,
                    child: Text(THelperFunctions.decodeUtf8(district.name)),
                  );
                }).toList(),
                onChanged: _onDistrictChanged,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Neighborhood Dropdown
              DropdownButtonFormField<NeighborhoodDTO>(
                hint: const Text(TTexts.neighborhood),
                items: _neighborhoods.map((neighborhood) {
                  return DropdownMenuItem<NeighborhoodDTO>(
                    value: neighborhood,
                    child: Text(THelperFunctions.decodeUtf8(neighborhood.name)),
                  );
                }).toList(),
                onChanged: (NeighborhoodDTO? newValue) {
                  setState(() {
                    _selectedNeighborhood = newValue;
                  });
                },
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Fetch Suggestions Button
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  onPressed: _fetchSuggestions,
                  text: 'Önerileri Gör',
                  textColor: TColors.dark,
                  backgroundGradient: TColors.recommendationGradient,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
