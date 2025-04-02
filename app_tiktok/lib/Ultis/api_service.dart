import 'package:app_tiktok/enity/my_product.dart';
import 'package:dio/dio.dart';

class APIService {
  static Future<List<MyProduct>> getAllProduct() async {
    var dio = Dio();
    var response = await dio.request(
      'https://fakestoreapi.com/products',
      options: Options(
        method: 'GET',
      ),
    );

    if (response.statusCode == 200 && response.data != null) {
      print(response.data);
      List<dynamic> rs = response.data;

      return rs.map((e) => MyProduct.fromJson(e)).toList();
    } else {
      // print(response.statusMessage);

      // throw Exception(response.statusMessage);
      return [];
    }
  }
}
