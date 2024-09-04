import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toprak_rehberi/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:toprak_rehberi/service/test_get/http_get_cities_screen.dart';
import 'package:toprak_rehberi/service/test_get/http_city_service.dart';
import 'package:toprak_rehberi/service/user/signup_form_test.dart';

import 'http_get_districts_screen.dart';

class TActionButtons extends StatelessWidget {
  TActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => Get.to(() => HttpGetCitiesScreen()),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Get Cities'),
              ),
            ),
            ElevatedButton(
              onPressed: () => Get.to(() => HttpGetDistrictsScreen()),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Get Districts'),
              ),
            ),
            ElevatedButton(
              onPressed: () => Get.to(() => TSignupFormTest()),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Add User'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
