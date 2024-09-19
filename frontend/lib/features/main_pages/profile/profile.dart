import 'package:flutter/material.dart';
import 'package:toprak_rehberi/dtos/UserDTO.dart';
import 'package:toprak_rehberi/features/main_pages/profile/widgets/change_info.dart';
import 'package:toprak_rehberi/features/main_pages/profile/widgets/profile_section.dart';
import 'package:toprak_rehberi/features/main_pages/profile/widgets/profile_section_button.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

import '../../../service/fetching/pages/fetch_user.dart';
import '../../authentication/screens/first_screen/first_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(false);
      },
      child: Scaffold(
        body: FutureBuilder<UserDTO>(
          future: fetchUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor,
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('No user data available.'));
            }

            UserDTO user = snapshot.data!;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    const SizedBox(height: TSizes.appBarHeight),

                    // First Name
                    TProfileSection(
                      title: TTexts.firstName,
                      value: user.firstName ?? 'N/A',
                      onTap: () =>
                          changeInfo(context: context, info: TTexts.firstName),
                    ),

                    // Last Name
                    TProfileSection(
                      title: TTexts.lastName,
                      value: user.lastName ?? 'N/A',
                      onTap: () =>
                          changeInfo(context: context, info: TTexts.lastName),
                    ),

                    // Email
                    TProfileSection(
                      title: TTexts.email,
                      value: user.email ?? 'N/A',
                      onTap: () =>
                          changeInfo(context: context, info: TTexts.email),
                    ),

                    // Phone Number
                    TProfileSection(
                      title: TTexts.phoneNoShort,
                      value: user.phoneNumber ?? 'N/A',
                      onTap: () =>
                          changeInfo(context: context, info: TTexts.phoneNo),
                    ),

                    // Password
                    TProfileSection(
                      title: TTexts.password,
                      value: '**********',
                      onTap: () =>
                          changeInfo(context: context, info: TTexts.password),
                    ),

                    const SizedBox(height: TSizes.spaceBtwSections),

                    // Logout Button
                    TProfileSectionButton(
                      toWhere: () => _showLogoutConfirmationDialog(context),
                      text: TTexts.logOut,
                      textColor: TColors.primaryColor,
                    ),

                    const SizedBox(height: TSizes.spaceBtwSections * 3),

                    // Close Account Button
                    const TProfileSectionButton(
                      text: TTexts.closeAccount,
                      textColor: TColors.error,
                    ),

                    const SizedBox(height: TSizes.spaceBtwSections),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void _showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Çıkış yapmak istediğinizden emin misiniz?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Hayır'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _logout(context);
            },
            child: const Text('Evet'),
          ),
        ],
      );
    },
  );
}

void _logout(BuildContext context) async {
  try {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const FirstScreen()),
      (Route<dynamic> route) => false,
    );
  } catch (error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Logout failed: $error')),
    );
  }
}
