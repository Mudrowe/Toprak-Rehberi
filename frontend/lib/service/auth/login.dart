import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> login(String email, String password) async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/auth/login';
  final url = Uri.parse(baseUrl);

  try {
    var http;
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      String token = responseBody['token'];  // Adjust according to your API response structure

      // Save the token in SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('authToken', token);

      print('Token saved: $token');
    } else {
      throw Exception('Failed to login');
    }
  } catch (e) {
    throw Exception('Failed to login: $e');
  }
}
