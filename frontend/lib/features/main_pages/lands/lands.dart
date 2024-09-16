import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toprak_rehberi/features/main_pages/lands/add_land_screen/add_land_screen.dart';
import 'package:toprak_rehberi/features/main_pages/lands/widgets/land_card/land_card.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

import '../../../dtos/LandDTO.dart';
import '../../../dtos/UserDTO.dart';
import '../../../service/fetching/pages/fetch_lands.dart';
import '../../../service/fetching/pages/fetch_user.dart';

class LandsScreen extends StatefulWidget {
  const LandsScreen({super.key});

  @override
  _LandsScreenState createState() => _LandsScreenState();
}

class _LandsScreenState extends State<LandsScreen> {
  late Future<List<LandDTO>> _landsFuture;
  late Future<UserDTO> _userFuture;

  void _fetchLands() {
    _userFuture = fetchUser();
    _landsFuture = _userFuture.then((user) => fetchLandsByUserId(user.id!));
  }

  @override
  void initState() {
    super.initState();

    _fetchLands();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UserDTO>(
        future: _userFuture,
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (userSnapshot.hasError) {
            return Center(child: Text('Error: ${userSnapshot.error}'));
          } else if (!userSnapshot.hasData) {
            return const Center(child: Text('No user data available.'));
          }

          // Print the UserDTO data
          print('UserDTO: ${userSnapshot.data!.toJson()}');

          return FutureBuilder<List<LandDTO>>(
            future: _landsFuture,
            builder: (context, landsSnapshot) {
              if (landsSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (landsSnapshot.hasError) {
                print(Text('Error 2: ${landsSnapshot.error}'));
              }

              final landsDTOList = landsSnapshot.data!;

              return SingleChildScrollView(
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
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(TTexts.totalLands),
                              Text(landsDTOList.length.toString()),
                            ],
                          ),
                          const Divider(
                            indent: TSizes.dividerIndent,
                            endIndent: TSizes.dividerIndent,
                          ),

                          // Lands
                          for (var land in landsDTOList)
                            Column(
                              children: [
                                TLandCard(landDTO: land),
                                const SizedBox(height: TSizes.spaceBtwItems),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
