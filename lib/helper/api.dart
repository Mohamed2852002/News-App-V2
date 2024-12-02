import 'package:dio/dio.dart';

class Api {
  static final Dio dio = Dio();
  static Future<Map<String, dynamic>> get(String url) async {
    final Response response = await dio.get(url);
    return response.data;
  }
}
