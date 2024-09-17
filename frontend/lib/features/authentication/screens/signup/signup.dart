import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Titles
              SizedBox(height: TSizes.spaceBtwSections),

              // Form
              TSignupForm(),
            ],
          ),
        ),
      ),
    );
  }
}
