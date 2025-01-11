import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:online_shopping_app/Model/Banner%20model.dart';
import '../utils/global variable .dart';
class BannerController {
  
//fetch banner
Future<List<BannerModel>> loadBanners() async {
  try {
    http.Response response = await http.get(Uri.parse('$uri/api/banner'));
    log('response: ${response.body}');
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<BannerModel> banners = data.map((dynamic item) => BannerModel.fromJson(item)).toList();
      return banners;
    } else {
      throw "Failed to load banners";
    }
  } catch (e) {
    print("Error fetching banners: $e");
    return [];
  }
  }

}