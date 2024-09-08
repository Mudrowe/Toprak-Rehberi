import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import '../../dtos/LandTypeDTO.dart';
import 'HttpLandTypeService.dart';

class HttpGetLandTypesScreen extends StatelessWidget {
  final HttpLandTypeService httpService = HttpLandTypeService();
  HttpGetLandTypesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: 'HTTP GET LAND TYPES',
        showBackButton: false,
      ),
      body: FutureBuilder<List<LandTypeDTO>>(
        future: httpService.fetchLandTypes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error ?? 'Unknown error'}'));
          } else if (snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty) {
            final List<LandTypeDTO> landTypes = snapshot.data!;
            return ListView.builder(
              itemCount: landTypes.length,
              itemBuilder: (context, index) {
                final LandTypeDTO landType = landTypes[index];
                return ListTile(
                  leading: landType.imageUrl.isNotEmpty
                      ? Image.network(landType.imageUrl)
                      : null,
                  title: Text(landType.name),
                  subtitle: Text('ID: ${landType.id}'),
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
