import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:toprak_rehberi/service/auth/token_service.dart';

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
      String token = responseBody['token'];

      setAuthToken(token);

      print('Token saved: $token');
    } else {
      throw Exception('Failed to login');
    }
  } catch (e) {
    throw Exception('Failed to login: $e');
  }
}
