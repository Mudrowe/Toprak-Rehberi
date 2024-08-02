import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  // Light Theme
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: TColors.primaryColor,
    suffixIconColor: TColors.primaryColor,
    labelStyle: const TextStyle().copyWith(fontSize: TSizes.fontSizeMd, color: TColors.primaryColor.withOpacity(0.5)),
    hintStyle: const TextStyle().copyWith(fontSize: TSizes.fontSizeSm, color: TColors.primaryColor.withOpacity(0.5)),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: TColors.primaryColor.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.primaryColor),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.primaryColor),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.primaryColor),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: TColors.error),
    ),
  );


  // Dark Theme
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: TColors.primaryColor,
    suffixIconColor: TColors.primaryColor,
    labelStyle: const TextStyle().copyWith(fontSize: TSizes.fontSizeMd, color: TColors.white.withOpacity(0.5)),
    hintStyle: const TextStyle().copyWith(fontSize: TSizes.fontSizeMd, color: TColors.white.withOpacity(0.5)),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: TColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.primaryColor),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.primaryColor),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: TColors.error),
    ),
  );
}
