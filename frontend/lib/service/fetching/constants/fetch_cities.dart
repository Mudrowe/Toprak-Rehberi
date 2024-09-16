import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../../dtos/location/CityDTO.dart';

Future<List<CityDTO>> fetchCities() async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/cities';
  final url = Uri.parse(baseUrl);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('authToken');

  if (token == null) {
    throw Exception('Token is null, please log in again.');
  }

  print('Token (Fetch Cities Function): $token');

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
      return data.map((json) => CityDTO.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cities');
    }
  } catch (e) {
    throw Exception('Failed to fetch cities');
  }
}

Future<CityDTO> fetchCityById(int cityId) async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/cities/$cityId';
  final url = Uri.parse(baseUrl);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('authToken');

  if (token == null) {
    throw Exception('Token is null, please log in again.');
  }

  print('Token (Fetch City by Id Function): $token');

  try {
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return CityDTO.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load city');
    }
  } catch (e) {
    throw Exception('Failed to fetch city: $e');
  }
}
