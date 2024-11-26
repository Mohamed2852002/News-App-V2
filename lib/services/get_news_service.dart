import 'package:news_app_v2/helper/api.dart';
import 'package:news_app_v2/models/article_model.dart';

class GetNewsService {
  static Future<List<ArticleModel>> getNews({required String category}) async {
    String baseUrl = 'https://newsapi.org/v2';
    String apiKey = '6eb2051751984dcab63690b986520768';
    Map<String, dynamic> data = await Api.get(
        '$baseUrl/top-headlines?category=$category&apiKey=$apiKey');
    List<ArticleModel> articles = [];
    for (var i = 0; i < data["articles"].length; i++) {
      articles.add(
        ArticleModel.fromJson(data, i),
      );
    }
    return articles;
  }
}
