import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../dtos/CityDTO.dart';

class HttpCityService {
  Future<List<CityDTO>> fetchCities() async {
    var ipAddress = dotenv.env['IP_ADDRESS'];
    var baseUrl = 'http://$ipAddress:8080/api/cities';

    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);

        // Convert JSON data to List<CityDTO>
        List<CityDTO> cities = jsonResponse.map((data) => CityDTO.fromJson(data)).toList();

        return cities;
      } else {
        // Handle unexpected status codes
        throw Exception('Failed to load data. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle and log any exceptions
      print('Exception: $e');
      throw Exception('Failed to fetch data');
    }
  }

}