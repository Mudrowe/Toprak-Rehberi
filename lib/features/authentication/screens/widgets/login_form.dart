import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:toprak_rehberi/features/authentication/screens/signup/signup.dart';
import 'package:toprak_rehberi/navigation_menu.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Form(child: Column (
        children: [
          // Email
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email), labelText: TTexts.email,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields,),
      
          // Password
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock), 
              labelText: TTexts.password,
              suffixIcon: Icon(Icons.visibility)
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields / 2,),
      
          // Remember Me & Forget Password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // Remember Me
            children: [
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value){}),
                  const Text(TTexts.rememberMe),
                ],
              ),
      
              // Forget Password
              TextButton(onPressed: (){}, 
              child: const Text(TTexts.forgetPassword)),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwSections,),
      
          // Sign In Button
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const NavigationMenu()), child: const Text(TTexts.signIn))),
          const SizedBox(height: TSizes.spaceBtwItems,),
    
          // Sign Up Button
          SizedBox(
            width: double.infinity, 
            child: OutlinedButton(onPressed: () => Get.to(() => const SignupScreen()), child: const Text(TTexts.createAccount)))
        ],
      )
      ),
    );
  }
}