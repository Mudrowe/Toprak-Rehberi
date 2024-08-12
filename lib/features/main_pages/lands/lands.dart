import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

class LandsScreen extends StatelessWidget {
  const LandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(),
      body: Center(
        child: Column(
          children: [
            // Add Land Button
            Column(
              children: [
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
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text(TTexts.totalLands), Text('13')],
                ),

                const Divider(indent: 40, endIndent: 40),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
