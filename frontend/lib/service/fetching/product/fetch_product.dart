import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toprak_rehberi/models/product_option.dart';
import 'package:toprak_rehberi/service/fetching/product/fetch_product_options.dart';
import '../../../dtos/LandDTO.dart';
import '../../../dtos/ProductDTO.dart';
import '../pages/fetch_lands.dart';

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
        // Existing logic to parse and build ProductDTO
        int? landId = productJson['landId'];
        int? productOptionId = productJson['productOptionId'];

        // Fetch the land details to get the landName
        LandDTO land = await fetchLandById(landId!);
        ProductOption productOption =
        await fetchProductOptionById(productOptionId);

        ProductDTO productDTO = ProductDTO.fromJson({
          'id': productJson['id'],
          'plantingDate': productJson['plantingDate'],
          'harvestDate': productJson['harvestDate'],
          'landId': productJson['landId'],
          'score': productJson['score'],
          'productOptionId': productJson['productOptionId'],
          'productName': productOption.name,
          'imageUrl': productOption.imageUrl,
          'landName': land.name,
          'area': productJson['size'],
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
