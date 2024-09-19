import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../dtos/ProductDTO.dart';
import '../../../dtos/UserDTO.dart';
import '../pages/fetch_user.dart';

Future<List<ProductDTO>> fetchProducts() async {
  // Get token from SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('authToken');

  UserDTO user = await fetchUser();
  int userId = user.id!;

  //print('userId: $userId');

  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/product/byUserId/$userId';
  final url = Uri.parse(baseUrl);

  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    List<dynamic> productList = json.decode(response.body);
    return productList.map((json) => ProductDTO.fromJson(json)).toList();
  } else if (response.statusCode == 404) {
    return [];
  } else {
    throw Exception('Failed to load products');
  }
}

Future<List<ProductDTO>> fetchProductsByLandId(int landId) async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/product/byLand/$landId';

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('authToken');

  if (token == null) {
    throw Exception('No auth token found. Please log in.');
  }

  final url = Uri.parse(baseUrl);

  try {
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> productsJson = jsonDecode(response.body);
      List<ProductDTO> products = [];

      for (var productJson in productsJson) {
        ProductDTO productDTO = ProductDTO.fromJson({
          'id': productJson['id'],
          'plantingDate': productJson['plantingDate'],
          'harvestDate': productJson['harvestDate'],
          'land': productJson['land'],
          'score': productJson['score'],
          'productOption': productJson['productOption'],
          'area': productJson['area'],
          'harvested': productJson['harvested'],
        });

        products.add(productDTO);
      }

      return products;
    } else if (response.statusCode == 404) {
      // Return an empty list if the endpoint returns 404
      return [];
    } else {
      print('Failed with status code: ${response.statusCode}');
      throw Exception('Failed to load products');
    }
  } catch (e) {
    print('Failed to fetch products: $e');
    throw Exception('Failed to fetch products: $e');
  }
}
