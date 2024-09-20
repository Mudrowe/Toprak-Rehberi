import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../dtos/register_request.dart';

Future<void> createUser(RegisterRequest user) async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/auth/register';
  final url = Uri.parse(baseUrl);

  var jsonBody = jsonEncode(user.toJson());
  print('Sending RegisterRequest: $jsonBody');

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonBody,
  );

  if (response.statusCode == 200) {
    print('User created: ${response.body}');
  } else {
    print('Failed to create user: ${response.statusCode}');
  }
}
