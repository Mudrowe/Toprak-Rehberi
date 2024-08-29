import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import '../dtos/DistrictDTO.dart';
import 'http_district_service.dart'; // Import the district service

class HttpGetDistrictsScreen extends StatelessWidget {
  final HttpDistrictService httpService = HttpDistrictService(); // Use the district service

  HttpGetDistrictsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: 'HTTP GET DISTRICTS',
        showBackButton: false,
      ),
      body: FutureBuilder<List<DistrictDTO>>(
        future: httpService.fetchDistricts(), // Fetch districts
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error ?? 'Unknown error'}'));
          } else if (snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty) {
            final List<DistrictDTO> districts = snapshot.data!;
            return ListView.builder(
              itemCount: districts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(districts[index].name),
                  subtitle: Text('ID: ${districts[index].id}'),
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
