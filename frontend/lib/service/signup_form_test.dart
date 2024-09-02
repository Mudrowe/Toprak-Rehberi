import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';
import 'package:toprak_rehberi/features/authentication/screens/signup/widgets/terms_and_conditions_checkbox.dart';

import '../dtos/UserDTO.dart';
import 'http_add_user_service.dart';

class TSignupFormTest extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _phoneNo;
  String? _password;
  String? _confirmPassword;

  TSignupFormTest({super.key});

  void _saveForm(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      UserDTO user = UserDTO(
        id: 0,
        firstName: _firstName!,
        lastName: _lastName!,
        email: _email!,
        phoneNumber: _phoneNo!,
        password: _password!,
      );

      createUser(user).then((_) {
        // Handle success, show a message or navigate
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User created successfully!')));
      }).catchError((error) {
        // Handle error
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to create user.')));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
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
                        labelText: TTexts.firstName,
                      ),
                      onSaved: (String? value) {
                        _firstName = value;
                      },
                      validator: (String? value) {
                        return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                      },
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwInputFields),
                  // Last Name
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: TTexts.lastName,
                      ),
                      onSaved: (String? value) {
                        _lastName = value;
                      },
                      validator: (String? value) {
                        return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              // Email
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: TTexts.email,
                ),
                onSaved: (String? value) {
                  _email = value;
                },
                /*
                validator: (String? value) {
                  return (value != null && !value.contains('@')) ? 'Enter a valid email address.' : null;
                },
                 */
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              // Phone Number
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  labelText: TTexts.phoneNo,
                ),
                onSaved: (String? value) {
                  _phoneNo = value;
                },
                /*
                validator: (String? value) {
                  return (value != null && value.length != 10) ? 'Enter a valid phone number.' : null;
                },
                */
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              // Password
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: TTexts.password,
                  suffixIcon: Icon(Icons.visibility),
                ),
                obscureText: true,
                onSaved: (String? value) {
                  _password = value;
                },
                validator: (String? value) {
                  return (value != null && value.length < 6) ? 'Password must be at least 6 characters long.' : null;
                },
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              // Confirm Password
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: TTexts.password,
                  suffixIcon: Icon(Icons.visibility),
                ),
                obscureText: true,
                onSaved: (String? value) {
                  _confirmPassword = value;
                },
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              const TTermsAndConditionsCheckBox(),
              const SizedBox(height: TSizes.spaceBtwSections),
              ElevatedButton(
                onPressed: () => _saveForm(context),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
