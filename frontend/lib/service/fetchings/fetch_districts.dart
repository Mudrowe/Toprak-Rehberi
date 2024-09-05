import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../dtos/DistrictDTO.dart';

Future<List<DistrictDTO>> fetchDistricts(int cityId) async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/districts/byCity/$cityId';
  final url = Uri.parse(baseUrl);

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => DistrictDTO.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load districts');
    }
  } catch (e) {
    throw Exception('Failed to fetch districts.');
  }
}
