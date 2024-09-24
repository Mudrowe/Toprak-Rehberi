import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
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
import '../../../models/suggestion_product.dart';
import '../../../service/suggestion/suggestion.dart';
import '../../../utils/constants/colors.dart';
import 'ToprakRehberiResult.dart';

class ToprakRehberi extends StatefulWidget {
  const ToprakRehberi({super.key});

  @override
  State<ToprakRehberi> createState() => _ToprakRehberiState();
}

class _ToprakRehberiState extends State<ToprakRehberi> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
    if (_selectedNeighborhood == null) {
      _showErrorSnackbar('Lütfen bir mahalle/köy seçin.');
      return;
    }

    try {
      List<SuggestionProduct> suggestions =
          await fetchSuggestionsByNeighborhood(_selectedNeighborhood!.id);
      if (suggestions.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ToprakRehberiResult(
              suggestionsList: suggestions,
            ),
          ),
        );
      } else {
        _showErrorSnackbar('Bu mahalle için öneri bulunamadı.');
      }
    } catch (error) {
      _showErrorSnackbar('Önerileri yükleme hatası: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: const TAppBar(showBackButton: false,),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.lg),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Lütfen il, ilçe ve mahalleyi seçtikten sonra "Önerileri Gör" butonuna tıklayın.\n Toprak Rehberi, seçtiğiniz mahalleye veya köye uygun ürün önerileri sunacaktır.',
                      style: TextStyle(
                          fontSize: 16,
                          color: dark ? TColors.light : TColors.dark),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // City Dropdown
                  DropdownButtonFormField<CityDTO>(
                    hint: const Text(TTexts.city),
                    items: _cities.map(
                      (city) {
                        return DropdownMenuItem<CityDTO>(
                          value: city,
                          child: Text(THelperFunctions.decodeUtf8(city.name)),
                        );
                      },
                    ).toList(),
                    onChanged: _onCityChanged,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // District Dropdown
                  DropdownButtonFormField<DistrictDTO>(
                    hint: const Text(TTexts.district),
                    items: _districts.map(
                      (district) {
                        return DropdownMenuItem<DistrictDTO>(
                          value: district,
                          child: Text(THelperFunctions.decodeUtf8(district.name)),
                        );
                      },
                    ).toList(),
                    onChanged: _onDistrictChanged,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // Neighborhood Dropdown
                  DropdownButtonFormField<NeighborhoodDTO>(
                    hint: const Text(TTexts.neighborhood),
                    items: _neighborhoods.map(
                      (neighborhood) {
                        return DropdownMenuItem<NeighborhoodDTO>(
                          value: neighborhood,
                          child: Text(
                              THelperFunctions.decodeUtf8(neighborhood.name)),
                        );
                      },
                    ).toList(),
                    onChanged: (NeighborhoodDTO? newValue) {
                      setState(
                        () {
                          _selectedNeighborhood = newValue;
                        },
                      );
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
                      isShimmer: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
