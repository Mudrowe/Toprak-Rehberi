import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/dtos/LandDTO.dart';
import 'package:toprak_rehberi/features/main_pages/lands/land_details/add_product_screen/widgets/add_product_form.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

import '../widgets/helpers/suggestions_button.dart';

// ! There will be all of the products in the dropdown menu in the final form
// ! So, what is the point of show suggestion button?

// TODO     After selecting the dropdown menu item,
// TODO     there is no space between
// TODO     selected product and suggestion score

class AddProductScreen extends StatelessWidget {
  final LandDTO landDTO;

  const AddProductScreen({super.key, required this.landDTO});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const TAppBar(showBackButton: true),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace * 2),
          child: Column(
            children: [
              const SizedBox(height: TSizes.appBarHeight),

              // Suggestions Button
              const TSuggestionsButton(),

              const SizedBox(height: TSizes.spaceBtwSections * 2),

              Container(
                width: TSizes.buttonWidth / 1.3,
                height: TSizes.buttonHeight * 2.3,
                decoration: getCardDecoration(context),
                child: Center(
                  child: Text(
                    THelperFunctions.decodeUtf8(landDTO.name),
                    style: textTheme.titleLarge,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              const SizedBox(height: TSizes.spaceBtwSections * 2),

              TAddProductForm(landDTO: landDTO),
            ],
          ),
        ),
      ),
    );
  }
}
