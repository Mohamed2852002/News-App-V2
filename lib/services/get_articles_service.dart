import 'package:dio/dio.dart';
import 'package:news_app_v2/constants/constants.dart';
import 'package:news_app_v2/error/failure.dart';
import 'package:news_app_v2/helper/api.dart';
import 'package:news_app_v2/models/articles_response_model/articles_response_model.dart';

class GetArticlesService {
  static Future<ArticlesResponseModel> getArticles(String sourceId) async {
    try {
      var data = await Api.get(
          '$baseUrl${everythingEndPoint}apiKey=$apiKey&sources=$sourceId');
      ArticlesResponseModel sourcesResponseModel =
          ArticlesResponseModel.fromJson(data);
      return sourcesResponseModel;
    } on DioException catch (e) {
      return ArticlesResponseModel(
          errorMessage: ServerFailure.fromDioException(e));
    }
  }
}