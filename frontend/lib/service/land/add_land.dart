import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../dtos/LandDTO.dart';
import '../fetchings/pages/fetch_user.dart';

Future<void> addLand(LandDTO landDTO) async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/land';

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('authToken');

  if (token == null) {
    throw Exception('No auth token found. Please log in.');
  }

  // Extract email from the token
  String? email = await extractEmailFromToken(token);
  print("Email in the addLand (extractEmailFromToken function): " + email);
  if (email == null) {
    throw Exception('Failed to extract email from token');
  }

  print("Sending LandDTO JSON: " + landDTO.toString());
  // Fetch user ID using email
  final userId = await getUserIdByEmail(email);

  print("User id from getUserIdByEmail2: " + userId.toString());
  if (userId == null) {
    throw Exception('Failed to retrieve user ID');
  }

  print("Sending LandDTO JSON: " + landDTO.toString());
  // Update LandDTO with the userId
  landDTO.userId = userId;

  final url = Uri.parse(baseUrl);

  print("Sending LandDTO JSON: " + landDTO.toString());
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(landDTO.toJson()),
  );

  // Log the JSON payload being sent to the backend
  print('Sending LandDTO JSON: ${jsonEncode(landDTO.toJson())}');
  //print("Sending LandDTO JSON: " + landDTO.toString());

  if (response.statusCode == 201) {
    // Land added successfully
    print('Land added: ${response.body}');
  } else {
    // Error handling
    print('Failed to add land: ${response.statusCode}');
  }
}
