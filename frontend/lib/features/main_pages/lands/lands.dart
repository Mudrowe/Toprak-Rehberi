import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/custom_shapes/search_container.dart';
import 'package:toprak_rehberi/features/main_pages/lands/add_land_screen/add_land_screen.dart';
import 'package:toprak_rehberi/features/main_pages/lands/widgets/land_card/land_card.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

import '../../../common/widgets/custom_shapes/floating_button.dart';
import '../../../dtos/LandDTO.dart';
import '../../../dtos/UserDTO.dart';
import '../../../service/fetching/pages/fetch_lands.dart';
import '../../../service/fetching/pages/fetch_user.dart';
import '../../../utils/helpers/helper_functions.dart';

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
    final dark = THelperFunctions.isDarkMode(context);
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: FutureBuilder<UserDTO>(
          future: _userFuture,
          builder: (context, userSnapshot) {
            if (userSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor,
                  ),
                ),
              );
            } else if (userSnapshot.hasError) {
              return Center(child: Text('Error: ${userSnapshot.error}'));
            } else if (!userSnapshot.hasData) {
              return const Center(child: Text('No user data available.'));
            }
            final userJson = userSnapshot.data!.toJson();
            print('User JSON: $userJson');

            return FutureBuilder<List<LandDTO>>(
              future: _landsFuture,
              builder: (context, landsSnapshot) {
                if (landsSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  );
                } else if (landsSnapshot.hasError) {
                  return Center(child: Text('Error: ${landsSnapshot.error}'));
                } else if (!landsSnapshot.hasData) {
                  return const Center(child: Text('No lands available.'));
                }

                final landsDTOList = landsSnapshot.data!;
                for (var landDTO in landsDTOList) {
                  print(landDTO.toJson());

                }

                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: TSizes.appBarHeight),
                    child: Column(
                      children: [
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
        floatingActionButton: FloatingButton(
          dark: dark,
          label: 'Arazi Ekle',
          route: const TAddLandScreen(),
        ),
      ),
    );
  }
}
