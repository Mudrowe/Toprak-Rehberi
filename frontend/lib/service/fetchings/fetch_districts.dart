import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../dtos/DistrictDTO.dart';

Future<List<DistrictDTO>> fetchDistricts(int cityId) async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/districts/byCity/$cityId';
  final url = Uri.parse(baseUrl);

  // Get token from SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('authToken');

  if (token == null) {
    throw Exception('Token is null, please log in again.');
  }

  print('Token (Fetch Districts Function): $token');

  try {
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => DistrictDTO.fromJson(json)).toList();
    } else {
      print(Exception);
      throw Exception('Failed to load districts');
    }
  } catch (e) {
    print(Exception);
    throw Exception('Failed to fetch districts: $e');
  }
}
