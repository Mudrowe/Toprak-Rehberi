import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toprak_rehberi/service/http_get_cities_screen.dart';
import 'package:toprak_rehberi/service/http_city_service.dart';

import 'http_get_districts_screen.dart';

class TGetCitiesButton extends StatelessWidget {
  TGetCitiesButton({super.key});

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
          ],
        ),
      ),
    );
  }
}
