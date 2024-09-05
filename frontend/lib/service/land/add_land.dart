import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../dtos/LandDTO.dart';

Future<void> addLand(LandDTO landDTO) async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/land';
  final url = Uri.parse(baseUrl);

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
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
