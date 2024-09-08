import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaulSpace),
          child: Column(
            children: [
              // Titles
              const SizedBox(height: TSizes.spaceBtwSections),

              // Form
              TSignupForm(),
            ],
          ),
        ),
      ),
    );
  }
}
