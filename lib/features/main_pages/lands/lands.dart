import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/features/main_pages/lands/widgets/land_card/land_card.dart';
import 'package:toprak_rehberi/features/main_pages/lands/seed/lands_list.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

class LandsScreen extends StatelessWidget {
  const LandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(),
      body: Center(
        child: SingleChildScrollView(
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
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              // Total Land Info
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(TTexts.totalLands),
                  Text(landsList.length.toString()),
                ],
              ),

              const Divider(indent: 40, endIndent: 40),
              for (var land in landsList)
                Column(
                  children: [
                    TLandCard(land: land),
                    const SizedBox(height: TSizes.spaceBtwItems),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
