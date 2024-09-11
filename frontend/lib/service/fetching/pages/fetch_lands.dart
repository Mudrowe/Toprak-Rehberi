import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toprak_rehberi/dtos/LandDTO.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

Future<List<LandDTO>> fetchLands() async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/land';
  final url = Uri.parse(baseUrl);


  // Get token from SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('authToken');


  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    final List<dynamic> landsJson = json.decode(response.body);
    return landsJson.map((json) => LandDTO.fromJson(json)).toList();

  } else {
    throw Exception('Failed to load lands (fetchLands function)');
  }
}


Future<List<LandDTO>> fetchLandsByUserId(int userId) async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/land/byUserId/$userId';
  final url = Uri.parse(baseUrl);


  // Get token from SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('authToken');


  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    final List<dynamic> landsJson = json.decode(response.body);
    return landsJson.map((json) => LandDTO.fromJson(json)).toList();

  } else {
    throw Exception('Failed to load land by userId');
  }
}

Future<LandDTO> fetchLandByName(String name) async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  String utf8Name = THelperFunctions.decodeUtf8(name);
  var baseUrl = 'http://$ipAddress:8080/api/land/byName/$utf8Name';
  final url = Uri.parse(baseUrl);


  // Get token from SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('authToken');


  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    return LandDTO.fromJson(jsonData);
  } else {
    throw Exception('Failed to load land by landName');
  }
}

Future<LandDTO> fetchLandById(int id) async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/land/byId/$id';
  final url = Uri.parse(baseUrl);


  // Get token from SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('authToken');


  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    return LandDTO.fromJson(jsonData);
  } else {
    throw Exception('Failed to load lands by landId');
  }
}