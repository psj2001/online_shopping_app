import 'dart:convert';
import 'dart:developer';

import 'package:online_shopping_app/Model/Product%20model.dart';
import 'package:http/http.dart'as http;
import 'package:online_shopping_app/utils/global%20variable%20.dart';
class ProductController {

//load the uploaded category

  Future<List<Product>> loadProduct() async {
  try {
    http.Response response = await http.get(Uri.parse('$uri/api/popular-products'));
    log('response from product:====> ${response.body}');
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Product> products = data.map((dynamic item) => Product.fromJson(item)).toList();
      return products;
    } else {
      throw Exception("Failed to load Category");
    }
  } catch (e) {
    print("Error fetching products: $e");
    return [];
  }
  }

  ///Loading the product by its category
  
    Future<List<Product>> loadProductByCategory(String category) async {
  try {
    http.Response response = await http.get(Uri.parse('$uri/api/products-by-category/$category'));
    log('response from product by category:====> ${response.body}');
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Product> products = data.map((dynamic item) => Product.fromJson(item)).toList();
      return products;
    } else {
      throw Exception("Failed to load Category");
    }  
  } catch (e) {
    print("Error fetching products: $e");
    return [];
  }
  }

}