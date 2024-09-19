import 'package:flutter/material.dart';
import 'package:toprak_rehberi/features/authentication/screens/login/login.dart';
import 'package:toprak_rehberi/features/authentication/screens/signup/signup.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

class TButtons extends StatelessWidget {
  const TButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      color: dark ? TColors.dark : TColors.light,
      padding: const EdgeInsets.symmetric(horizontal: TSizes.spaceBtwItems, vertical: TSizes.spaceBtwSections),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              ),
              child: const Text(TTexts.signIn),
            ),
          ),
          const SizedBox(width: TSizes.spaceBtwItems),
          Expanded(
            child: ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignupScreen()),
              ),
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
