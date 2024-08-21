import 'package:flutter/material.dart';
import 'package:toprak_rehberi/features/main_pages/profile/widgets/change_info.dart';
import 'package:toprak_rehberi/features/main_pages/profile/widgets/profile_section.dart';
import 'package:toprak_rehberi/features/main_pages/profile/widgets/profile_section_button.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaulSpace),
          child: Column(
            children: [
              const SizedBox(height: TSizes.appBarHeight),

              // First Name
              TProfileSection(
                title: TTexts.firstName,
                value: TTexts.firstNameSpecial,
                onTap: () =>
                    changeInfo(context: context, info: TTexts.firstName),
              ),

              // Last Name
              TProfileSection(
                title: TTexts.lastName,
                value: TTexts.lastNameSpecial,
                onTap: () =>
                    changeInfo(context: context, info: TTexts.lastName),
              ),

              // Email
              TProfileSection(
                title: TTexts.email,
                value: TTexts.emailSpecial,
                onTap: () => changeInfo(context: context, info: TTexts.email),
              ),

              // Phone Number
              TProfileSection(
                title: TTexts.phoneNoShort,
                value: TTexts.phoneNoSpecial,
                onTap: () => changeInfo(context: context, info: TTexts.phoneNo),
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
              const TProfileSectionButton(
                text: TTexts.logOut,
                textColor: TColors.primaryColor,
              ),

              const SizedBox(height: TSizes.spaceBtwSections * 3),

              // Close Account Button
              const TProfileSectionButton(
                text: TTexts.closeAccount,
                textColor: TColors.error,
              ),

              const SizedBox(height: TSizes.spaceBtwSections)
            ],
          ),
        ),
      ),
    );
  }
}
