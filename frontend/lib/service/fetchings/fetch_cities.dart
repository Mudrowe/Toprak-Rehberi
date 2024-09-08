import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../dtos/CityDTO.dart';
import '../auth/token_service.dart';

Future<List<CityDTO>> fetchCities() async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/cities';
  final url = Uri.parse(baseUrl);

  String? token = await getAuthToken();

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

