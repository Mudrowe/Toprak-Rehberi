import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:toprak_rehberi/dtos/LandDTO.dart';
import 'package:toprak_rehberi/models/land/land.dart';
import 'package:toprak_rehberi/service/auth/token_service.dart';

Future<List<LandDTO>> fetchLands() async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/land';
  final url = Uri.parse(baseUrl);

  final String? token = await getAuthToken();

  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    final List<dynamic> landsJson = json.decode(response.body);

    // Convert JSON to Land instances
    final List<Land> lands = landsJson.map((json) => Land.fromJson(json)).toList();

    // Convert Land instances to LandDTO instances
    final List<LandDTO> landDTOs = lands.map((land) => convertLandToLandDTO(land)).toList();

    return landDTOs;
  } else {
    throw Exception('Failed to load lands');
  }
}
