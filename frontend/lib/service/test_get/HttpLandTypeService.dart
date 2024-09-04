import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../dtos/LandTypeDTO.dart';

class HttpLandTypeService {
  Future<List<LandTypeDTO>> fetchLandTypes() async {
    var ipAddress = dotenv.env['IP_ADDRESS'];
    var baseUrl = 'http://$ipAddress:8080/api/land_type';


    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final responseString = utf8.decode(response.bodyBytes);
      List<dynamic> jsonResponse = json.decode(responseString);

      print('JSON Response: $jsonResponse');

      // Convert JSON data to List<LandTypeDTO>
      List<LandTypeDTO> landTypes = jsonResponse.map((data) => LandTypeDTO.fromJson(data)).toList();

      return landTypes;
    } else {
      throw Exception('Failed to load land types');
    }
  }

}
