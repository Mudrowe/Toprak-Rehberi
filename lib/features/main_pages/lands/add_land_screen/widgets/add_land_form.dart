import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

// ! Change the color theme of DropdownButtonFormField

class TAddLandForm extends StatelessWidget {
  const TAddLandForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(height: TSizes.appBarHeight),

          // Land Name
          TextFormField(
            decoration: const InputDecoration(labelText: TTexts.landName),
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // Land Type
          DropdownButtonFormField(
            hint: const Text(TTexts.landType),
            items: const [
              DropdownMenuItem(
                value: 'Tarla',
                child: Text('Tarla'),
              ),
              DropdownMenuItem(
                value: 'Bağ',
                child: Text('Bağ'),
              ),
              DropdownMenuItem(
                value: 'Bahçe',
                child: Text('Bahçe'),
              ),
            ],
            onChanged: (value) {},
          ),

          const SizedBox(height: TSizes.spaceBtwItems),
          // City & District
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField(
                  hint: const Text(TTexts.city),
                  items: const [
                    DropdownMenuItem(
                      value: 'Ankara',
                      child: Text('Ankara'),
                    ),
                    DropdownMenuItem(
                      value: 'İstanbul',
                      child: Text('İstanbul'),
                    ),
                    DropdownMenuItem(
                      value: 'İzmir',
                      child: Text('İzmir'),
                    ),
                  ],
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Expanded(
                child: DropdownButtonFormField(
                  hint: const Text(TTexts.district),
                  items: const [
                    DropdownMenuItem(
                      value: 'İlçe 1',
                      child: Text('İlçe 1'),
                    ),
                    DropdownMenuItem(
                      value: 'İlçe 2',
                      child: Text('İlçe 2'),
                    ),
                    DropdownMenuItem(
                      value: 'İlçe 3',
                      child: Text('İlçe 3'),
                    ),
                  ],
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField(
                  hint: const Text(TTexts.neighborhood),
                  items: const [
                    DropdownMenuItem(
                      value: 'Köy 1',
                      child: Text('Köy 1'),
                    ),
                    DropdownMenuItem(
                      value: 'Köy 2',
                      child: Text('Köy 2'),
                    ),
                    DropdownMenuItem(
                      value: 'Köy 3',
                      child: Text('Köy 3'),
                    ),
                  ],
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: '${TTexts.area} (${TTexts.squareSymbol})',
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: TSizes.spaceBtwItems),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: TTexts.parcelNo),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: TTexts.adaNo),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
