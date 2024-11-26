import 'dart:developer';

import 'package:dio/dio.dart';

class Api {
  static final Dio dio = Dio();
  static Future<dynamic> get(String url) async {
    try {
      final Response response = await dio.get(url);
      return response.data;
    } on DioException catch (e) {
      log(e.message.toString());
      log(e.error.toString());
      throw Exception(e.message);
    }
  }
}
