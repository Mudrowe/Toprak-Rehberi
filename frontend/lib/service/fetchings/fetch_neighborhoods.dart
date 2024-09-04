import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../dtos/NeighborhoodDTO.dart';

Future<List<NeighborhoodDTO>> fetchNeighborhoods(int districtId) async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/neighborhoods/$districtId';
  final url = Uri.parse(baseUrl);

  final response = await http.get(url);

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => NeighborhoodDTO.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load neighborhoods');
  }
}