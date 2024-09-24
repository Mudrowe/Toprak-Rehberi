import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../dtos/update_password_request.dart';
import '../../dtos/user_field_update_request.dart';

Future<void> updateUserField(UserFieldUpdateRequest request) async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/user/updateField';
  final url = Uri.parse(baseUrl);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('authToken');

  final response = await http.put(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(request.toJson()),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to update user info');
  }
}

Future<void> updatePassword(UpdatePasswordRequest request) async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/user/updatePassword';
  final url = Uri.parse(baseUrl);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('authToken');

  final response = await http.put(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(request.toJson()),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to update password');
  }
}
