import 'article.dart';

class ArticlesResponseModel {
  String? status;
  int? totalResults;
  String? errorMessage;
  List<Article>? articles;

  ArticlesResponseModel({this.status, this.totalResults, this.articles,this.errorMessage});

  factory ArticlesResponseModel.fromJson(Map<String, dynamic> json) {
    return ArticlesResponseModel(
      errorMessage: json['error'],
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
    
  }

  Map<String, dynamic> toJson() => {
        'error': errorMessage,
        'status': status,
        'totalResults': totalResults,
        'articles': articles?.map((e) => e.toJson()).toList(),
      };
}
