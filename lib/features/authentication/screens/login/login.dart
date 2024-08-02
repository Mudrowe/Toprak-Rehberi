import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/spacing_styles.dart';
import 'package:toprak_rehberi/features/authentication/screens/widgets/login_form.dart';
import 'package:toprak_rehberi/features/authentication/screens/widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo, Title
              TLoginHeader(),

              TLoginForm(),
            ],
          ),
        ),
      )
    );
  }
}



