import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:toprak_rehberi/dtos/LandDTO.dart';

Future<List<LandDTO>> fetchLands() async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/land';
  final url = Uri.parse(baseUrl);
  final response = await http.get(url);

  if (response.statusCode == 200) {
    List<dynamic> landList = json.decode(response.body);
    return landList.map((json) => LandDTO.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load lands');
  }
}
