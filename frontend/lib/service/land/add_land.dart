import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../dtos/LandDTO.dart';
import '../fetching/pages/fetch_user.dart';

Future<void> addLand(LandDTO landDTO) async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/land';

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('authToken');


  if (token == null) {
    throw Exception('No auth token found. Please log in.');
  }

  final userId = await getUserId(token);

  print("User id from getUserIdByEmail2: $userId");
  if (userId == null) {
    throw Exception('Failed to retrieve user ID');
  }

  // Update LandDTO with the userId
  landDTO.userId = userId;

  final url = Uri.parse(baseUrl);

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

  if (response.statusCode == 201) {
    // Land added successfully
    print('Land added: ${response.body}');
  } else {
    // Error handling
    print('Failed to add land: ${response.statusCode}');
  }
}
