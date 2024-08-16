import 'package:flutter/material.dart';
import 'package:toprak_rehberi/features/main_pages/products/filter_screen/circular_checkbox.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

Future<void> filter({
  required BuildContext context,
}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          int selectedIndex = -1; 

          void _onCheckboxChanged(int index) {
            setState(() {
              selectedIndex = index; 
            });
          }

          return AlertDialog(
            title: const Text('Zaman Filtresi'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    CircularCheckbox(
                      value: selectedIndex == 0,
                      onChanged: (value) {
                        if (value == true) {
                          _onCheckboxChanged(0);
                        }
                      },
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    const Text('Son 30 gün'),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Row(
                  children: [
                    CircularCheckbox(
                      value: selectedIndex == 1,
                      onChanged: (value) {
                        if (value == true) {
                          _onCheckboxChanged(1);
                        }
                      },
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    const Text('Son 3 ay'),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Row(
                  children: [
                    CircularCheckbox(
                      value: selectedIndex == 2,
                      onChanged: (value) {
                        if (value == true) {
                          _onCheckboxChanged(2);
                        }
                      },
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    const Text('2024'),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Row(
                  children: [
                    CircularCheckbox(
                      value: selectedIndex == 3,
                      onChanged: (value) {
                        if (value == true) {
                          _onCheckboxChanged(3);
                        }
                      },
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    const Text('2023'),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Row(
                  children: [
                    CircularCheckbox(
                      value: selectedIndex == 4,
                      onChanged: (value) {
                        if (value == true) {
                          _onCheckboxChanged(4);
                        }
                      },
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    const Text('Özel Filtre'),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
