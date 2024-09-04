import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import '../../dtos/CityDTO.dart';
import 'http_city_service.dart';

class HttpGetCitiesScreen extends StatelessWidget {
  final HttpCityService httpService = HttpCityService();
  HttpGetCitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: 'HTTP GET CITIES',
        showBackButton: false,
      ),
      body: FutureBuilder<List<CityDTO>>(
        future: httpService.fetchCities(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error ?? 'Unknown error'}'));
          } else if (snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty) {
            final List<CityDTO> cities = snapshot.data!;
            return ListView.builder(
              itemCount: cities.length,

              itemBuilder: (context, index) {
                var name = utf8.decode(cities[index].name.codeUnits);
                return ListTile(

                  title: Text(name.toString()),
                  subtitle: Text('ID: ${cities[index].id}'),
                );
              },
            );
          } else {
            return const Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}
