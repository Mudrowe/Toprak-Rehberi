import 'package:flutter/material.dart';
import 'package:toprak_rehberi/features/authentication/screens/signup/widgets/terms_and_conditions_checkbox.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Row(
          children: [
            // First Name
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: TTexts.firstName),
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwInputFields,
            ),
            // Last Name
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person), labelText: TTexts.lastName),
              ),
            ),
          ],
        ),

        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),
        // Email
        TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.email),
            labelText: TTexts.email,
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        // Phone Number
        TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.phone),
            labelText: TTexts.phoneNo,
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        // Password
        TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.lock),
            labelText: TTexts.password,
            suffixIcon: Icon(Icons.visibility),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        // Password Again
        TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.lock),
            labelText: TTexts.password,
            suffixIcon: Icon(Icons.visibility),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),

        const TTermsAndConditionsCheckBox(),
      ],
    ));
  }
}
