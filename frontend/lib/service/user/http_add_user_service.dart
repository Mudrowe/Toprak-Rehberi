import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../dtos/UserDTO.dart';

Future<void> createUser(UserDTO user) async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/v1/auth/register';
  final url = Uri.parse(baseUrl);


  var jsonBody = jsonEncode(user.toJson());
  print('Sending RegisterRequest: $jsonBody');

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(user.toJson()),
  );


  if (response.statusCode == 200) {
    // User created successfully
    print('User created: ${response.body}');
  } else {
    // Error handling
    print('Failed to create user: ${response.statusCode}');
  }
}
