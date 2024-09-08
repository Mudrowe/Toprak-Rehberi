import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toprak_rehberi/dtos/UserDTO.dart';

Future<UserDTO> fetchUser() async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/user/me';
  final url = Uri.parse(baseUrl);
  final response = await http.get(url);


  if (response.statusCode == 200) {
    return UserDTO.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load user data');
  }
}

Future<int?> getUserIdByEmail(String email) async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/v1/user/byEmail/$email';
  final url = Uri.parse(baseUrl);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('authToken');

  try {
    final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data["id"];

    } else {
      throw Exception('Failed to fetch user ID: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e'); // Print the error for debugging
    throw Exception('Failed to fetch user ID.');
  }
}


Future<String> extractEmailFromToken(String token) async {
  try {
    // Split the JWT token into header, payload, and signature
    List<String> parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token format');
    }

    // Decode the payload (second part) from Base64
    String payload = parts[1];
    String decodedPayload = utf8.decode(base64Url.decode(base64Url.normalize(payload)));

    print("Payload: " + payload);
    // Convert the payload into a Map
    Map<String, dynamic> payloadMap = jsonDecode(decodedPayload);

    print("PayloadMap: " + payloadMap.toString());
    // Extract the email
    return payloadMap['sub'] as String;
  } catch (e) {
    throw Exception('Failed to decode token: $e');
  }
}