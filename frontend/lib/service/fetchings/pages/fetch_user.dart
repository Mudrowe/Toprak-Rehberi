import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
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
