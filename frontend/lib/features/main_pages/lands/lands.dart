import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toprak_rehberi/features/main_pages/lands/add_land_screen/add_land_screen.dart';
import 'package:toprak_rehberi/features/main_pages/lands/widgets/land_card/land_card.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

import '../../../dtos/LandDTO.dart';
import '../../../dtos/LandTypeDTO.dart';
import '../../../models/land.dart';
import '../../../service/fetching/constants/fetch_land_types.dart';
import '../../../service/fetching/pages/fetch_lands.dart';
import '../../../service/fetching/pages/fetch_user.dart';
import '../../../utils/constants/enums.dart';

class LandsScreen extends StatefulWidget {
  const LandsScreen({super.key});

  @override
  _LandsScreenState createState() => _LandsScreenState();
}

class _LandsScreenState extends State<LandsScreen> {
  late Future<List<LandDTO>> _landsFuture;
  late Future<List<LandTypeDTO>> _landTypesFuture;
  late List<LandTypeDTO> _landTypesList = [];

  @override
  void initState() {
    super.initState();
    _landTypesFuture = fetchLandTypes();
    _landsFuture = _fetchLands();
  }

  Future<List<LandDTO>> _fetchLands() async {
    try {
      // Retrieve the token from SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('authToken');

      if (token == null) {
        throw Exception('No auth token found. Please log in.');
      }

      // Fetch land types
      _landTypesList = await _landTypesFuture;

      // Fetch userId using the token
      final userId = await getUserId(token);

      // Fetch lands for the user
      return await fetchLandsByUserId(userId!);
    } catch (e) {
      print('Error fetching lands: $e');
      throw e;
    }
  }

  LandType _getLandType(int? landTypeId) {
    try {
      final landTypeDTO = _landTypesList.firstWhere(
            (type) => type.id == landTypeId,
      );

      // Map LandTypeDTO to LandType enum
      return LandType.values.firstWhere(
            (type) => type.index == landTypeDTO.id,
      );
    } catch (e) {
      print('Error getting LandType: $e');
      return LandType.tarla;
    }
  }

  Address _convertToAddress(LandDTO landDTO) {
    return Address(
      city: 'City Placeholder',
      district: 'District Placeholder',
      neighborhood: 'Neighborhood',
      parcelNo: landDTO.parcelNo,
      adaNo: landDTO.adaNo,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: TSizes.appBarHeight),
            child: Column(
              children: [
                // Add Land Button
                const Text(
                  TTexts.addLand,
                  style: TextStyle(
                    fontSize: TSizes.fontSizeLg,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  iconSize: TSizes.iconLg,
                  onPressed: () => Get.to(() => const TAddLandScreen()),
                  icon: const Icon(Icons.add),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                // Total Land Info
                FutureBuilder<List<LandDTO>>(
                  future: _landsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      final landsDTOList = snapshot.data!;
                      final landsList = landsDTOList.map((landDTO) {
                        return convertLandDTOToLand(
                          landDTO,
                          _convertToAddress(landDTO),
                        );
                      }).toList();
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(TTexts.totalLands),
                              Text(landsList.length.toString()),
                            ],
                          ),
                          const Divider(
                            indent: TSizes.dividerIndent,
                            endIndent: TSizes.dividerIndent,
                          ),
                          // Lands
                          for (var land in landsList)
                            Column(
                              children: [
                                TLandCard(land: land),
                                const SizedBox(height: TSizes.spaceBtwItems),
                              ],
                            ),
                        ],
                      );
                    } else {
                      return const Text('No lands available');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
