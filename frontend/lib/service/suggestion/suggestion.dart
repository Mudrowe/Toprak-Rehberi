import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/suggestion_product.dart';

Future<List<SuggestionProduct>> fetchSuggestions(int landId) async {
  // Get token from SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('authToken');

  if (token == null) {
    throw Exception('No auth token found. Please log in.');
  }

  // Construct the URL using environment variables for IP address
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/suggestions/$landId';
  final url = Uri.parse(baseUrl);

  try {
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> suggestionsJson = jsonDecode(response.body);
      return suggestionsJson
          .map((json) => SuggestionProduct.fromJson(json))
          .toList();
    } else if (response.statusCode == 404) {
      // Return an empty list if the endpoint returns 404
      return [];
    } else {
      print('Failed with status code: ${response.statusCode}');
      throw Exception('Failed to load suggestions');
    }
  } catch (e) {
    print('Failed to fetch suggestions: $e');
    throw Exception('Failed to fetch suggestions: $e');
  }
}
