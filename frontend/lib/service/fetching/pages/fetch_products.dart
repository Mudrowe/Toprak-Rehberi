import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:toprak_rehberi/dtos/ProductDTO.dart';

Future<List<ProductDTO>> fetchProducts() async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/product';
  final url = Uri.parse(baseUrl);
  final response = await http.get(url);

  if (response.statusCode == 200) {
    List<dynamic> productList = json.decode(response.body);
    return productList.map((json) => ProductDTO.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}

Future<List<ProductDTO>> fetchPlantedProducts() async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/product/planted';
  final url = Uri.parse(baseUrl);
  final response = await http.get(url);


  if (response.statusCode == 200) {
    final List<dynamic> plantedProducts = json.decode(response.body);
    return plantedProducts.map((json) => ProductDTO.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load planted products');
  }
}

Future<List<ProductDTO>> fetchHarvestedProducts() async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/product/harvested';
  final url = Uri.parse(baseUrl);
  final response = await http.get(url);


  if (response.statusCode == 200) {
    final List<dynamic> harvestedProducts = json.decode(response.body);
    return harvestedProducts.map((json) => ProductDTO.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load harvested products');
  }
}