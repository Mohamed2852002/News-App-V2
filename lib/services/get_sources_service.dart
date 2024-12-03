import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app_v2/constants/constants.dart';
import 'package:news_app_v2/error/failure.dart';
import 'package:news_app_v2/helper/api.dart';
import 'package:news_app_v2/models/sources_response_model/sources_response_model.dart';

class GetSourcesService {
  static Future<Either<Failure, SourcesResponseModel>> getSources(
      String category) async {
    try {
      var data = await Api.get(
          '$baseUrl${sourcesEndPoint}apiKey=$apiKey&category=$category');
      SourcesResponseModel sourcesResponseModel =
          SourcesResponseModel.fromJson(data);
      return right(sourcesResponseModel);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    }
  }
}
