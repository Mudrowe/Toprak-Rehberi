import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

class TAddLandScreen extends StatelessWidget {
  const TAddLandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
    return Scaffold(
      appBar: const TAppBar(),
      body: Column(
        children: [
          const SizedBox(height: TSizes.appBarHeight),

          // Land Name
          TextFormField(
            decoration: const InputDecoration(labelText: TTexts.landName),
          ),

        ],
      ),
    );
  }
}
