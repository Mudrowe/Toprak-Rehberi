import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../../dtos/location/NeighborhoodDTO.dart';

Future<List<NeighborhoodDTO>> fetchNeighborhoods(int districtId) async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl =
      'http://$ipAddress:8080/api/neighborhoods/byDistrict/$districtId';
  final url = Uri.parse(baseUrl);

  // Get token from SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('authToken');

  if (token == null) {
    throw Exception('Token is null, please log in again.');
  }

  print('Token (Fetch Neighborhoods Function): $token');

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
      return data.map((json) => NeighborhoodDTO.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load neighborhoods');
    }
  } catch (e) {
    throw Exception('Failed to fetch neighborhoods.');
  }
}
