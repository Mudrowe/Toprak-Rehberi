import 'package:flutter/material.dart';
import 'package:toprak_rehberi/features/authentication/screens/first_screen/widgets/first_screen_background.dart';
import 'package:toprak_rehberi/features/authentication/screens/first_screen/widgets/first_screen_buttons.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            child: TFirstScreenBackground(),
          ),
          TButtons(),
        ],
      ),
    );
  }
}


