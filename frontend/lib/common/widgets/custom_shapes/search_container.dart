import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/features/main_pages/products/filter_screen/filter_screen.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/device/device_utility.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.onSearchChanged,
    this.showBackground = true,
    this.showBorder = true,
  });

  final ValueChanged<String> onSearchChanged;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final Color color = dark ? TColors.light : TColors.primaryColor;
    return Padding(
      padding: const EdgeInsets.only(
        left: TSizes.spaceBtwItems,
        right: TSizes.spaceBtwItems,
      ),
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        //padding: const EdgeInsets.all(TSizes.md),
        decoration: getCardDecoration(context),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                cursorColor: color,
                onChanged: onSearchChanged,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: color),
                  hintText: 'Ürün ara',
                  border: InputBorder.none,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: TSizes.md),
              child: GestureDetector(
                child: Icon(Icons.tune, color: color),
                onTap: () => filter(context: context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
