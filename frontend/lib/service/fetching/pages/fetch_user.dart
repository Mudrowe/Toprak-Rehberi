import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toprak_rehberi/dtos/UserDTO.dart';

Future<UserDTO> fetchUser() async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/user/me';
  final url = Uri.parse(baseUrl);

  // Get token from SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('authToken');

  try {
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      //print('Response body in fetchUser: ${response.body}');
      return UserDTO.fromJson(json.decode(response.body));
    } else {
      print('Failed with status code: ${response.statusCode}');
      throw Exception('Failed to load user data');
    }
  } catch (e) {
    print('Error: $e');
    throw Exception('Failed to fetch user.');
  }

}
