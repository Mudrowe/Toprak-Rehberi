import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/common/widgets/land_details/add_product_screen/widgets/select_product_dropdown_menu.dart';
import 'package:toprak_rehberi/common/widgets/land_details/widgets/helpers/suggestions_button.dart';
import 'package:toprak_rehberi/models/land/land.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

// ! There will be all of the products in the dropdown menu in the final form
// ! So, what is the point of show suggestion button?

// TODO     After selecting the dropdown menu item,
// TODO     there is no space between
// TODO     selected product and suggestion score

class AddProductScreen extends StatelessWidget {
  final Land land;

  const AddProductScreen({super.key, required this.land});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const TAppBar(showBackButton: true),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: TSizes.defaulSpace * 2),
          child: Column(
            children: [
              const SizedBox(height: TSizes.appBarHeight),

              // Suggestions Button
              const TSuggestionsButton(),

              const SizedBox(height: TSizes.spaceBtwSections * 2),

              // ! Sizes aren't flexible for long names
              Container(
                width: TSizes.buttonWidth / 2,
                height: TSizes.buttonHeight * 2,
                decoration: getCardDecoration(context),
                child: Center(
                  child: Text(
                    land.landName,
                    style: textTheme.titleLarge
                  ),
                ),
              ),

              const SizedBox(height: TSizes.spaceBtwSections * 2),

              const TSelectProductDropdownMenu(),

              const SizedBox(height: TSizes.spaceBtwSections * 2),

              TextFormField(
                decoration: InputDecoration(
                    hintText: '${TTexts.productArea} (${TTexts.squareSymbol})',
                    hintStyle: textTheme.bodyLarge),
              ),

              const SizedBox(height: TSizes.spaceBtwSections * 2),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(TTexts.submit),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
