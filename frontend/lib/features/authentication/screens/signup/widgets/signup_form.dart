import 'package:flutter/material.dart';
import 'package:toprak_rehberi/dtos/register_request.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';
import 'package:toprak_rehberi/features/authentication/screens/signup/widgets/terms_and_conditions_checkbox.dart';

import '../../../../../dtos/UserDTO.dart';
import '../../../../../service/user/http_add_user_service.dart';

class TSignupForm extends StatefulWidget {
  const TSignupForm({super.key});

  @override
  _TSignupFormState createState() => _TSignupFormState();
}

class _TSignupFormState extends State<TSignupForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _phoneNo;
  String? _password;
  String? _confirmPassword;

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  void _saveForm(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      RegisterRequest user = RegisterRequest(
        firstName: _firstName!,
        lastName: _lastName!,
        email: _email!,
        phoneNumber: _phoneNo!,
        password: _password!,
      );

      createUser(user).then((_) {
        // Handle success
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Kullanıcı oluşturuldu!')));
      }).catchError((error) {
        // Handle error
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Kullanıcı oluşturulamadı.')));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
                    return (value != null && value.contains('@'))
                        ? 'Do not use the @ char.'
                        : null;
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
                    return (value != null && value.contains('@'))
                        ? 'Do not use the @ char.'
                        : null;
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
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              labelText: TTexts.password,
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
            ),
            obscureText: !_isPasswordVisible,
            onSaved: (String? value) {
              _password = value;
            },
            /*
            validator: (String? value) {
              return (value != null && value.length < 6)
                  ? 'Şifre en az 6 karakter uzunluğunda olmalıdır..'
                  : null;
            },

             */
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Confirm Password
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              labelText: TTexts.password,
              suffixIcon: IconButton(
                icon: Icon(
                  _isConfirmPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                  });
                },
              ),
            ),
            obscureText: !_isConfirmPasswordVisible,
            onSaved: (String? value) {
              _confirmPassword = value;
            },
          ),

          const SizedBox(height: TSizes.spaceBtwSections),

          const TTermsAndConditionsCheckBox(),

          const SizedBox(height: TSizes.spaceBtwSections),

          // Signup Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _saveForm(context),
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
