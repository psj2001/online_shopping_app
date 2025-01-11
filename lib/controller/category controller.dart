import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:online_shopping_app/utils/global%20variable%20.dart';

import '../Model/Category model.dart';

class CategoryController {
 
  //load the uploaded category

  Future<List<Category>> loadCategories() async {
  try {
    http.Response response = await http.get(Uri.parse('$uri/api/categories'));
    log('response: ${response.body}');
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Category> categories = data.map((dynamic item) => Category.fromJson(item)).toList();
      return categories;
    } else {
      throw "Failed to load Category";
    }
  } catch (e) {
    print("Error fetching categories: $e");
    return [];
  }
  }
}
