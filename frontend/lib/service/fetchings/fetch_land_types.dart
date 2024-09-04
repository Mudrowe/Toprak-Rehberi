import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../dtos/LandTypeDTO.dart';

Future<List<LandTypeDTO>> fetchLandTypes() async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/land_type';
  final url = Uri.parse(baseUrl);


    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => LandTypeDTO.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load land types');
    }

}
