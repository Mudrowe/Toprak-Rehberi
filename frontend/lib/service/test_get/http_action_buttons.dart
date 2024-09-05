import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toprak_rehberi/service/test_get/http_get_cities_screen.dart';
import 'package:toprak_rehberi/service/test_get/http_get_land_types.dart';
import 'package:toprak_rehberi/service/user/signup_form_test.dart';

import '../../common/widgets/land_details/add_product_screen/add_product_screen.dart';
import '../../features/main_pages/lands/add_land_screen/add_land_screen.dart';
import 'http_get_districts_screen.dart';

class TActionButtons extends StatelessWidget {
  const TActionButtons({super.key});

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
              onPressed: () => Get.to(() => HttpGetLandTypesScreen()),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Get Land Types'),
              ),
            ),
            ElevatedButton(
              onPressed: () => Get.to(() => TSignupFormTest()),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Add User'),
              ),
            ),
            ElevatedButton(
              onPressed: () => Get.to(() => const TAddLandScreen()),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Add Land '),
              ),
            ),
            ElevatedButton(
              onPressed: () => Get.to(() => AddProductScreen()),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Add Product '),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
