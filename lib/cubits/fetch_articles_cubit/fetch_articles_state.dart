import 'package:news_app_v2/models/articles_response_model/article.dart';

class FetchArticlesState {}

final class FetchArticlesInitial extends FetchArticlesState {}

final class FetchArticlesLoading extends FetchArticlesState {}

final class FetchArticlesSuccess extends FetchArticlesState {
  final List<Article> articles;

  FetchArticlesSuccess({required this.articles});
}

final class FetchArticlesFailure extends FetchArticlesState {
  final String errorMessage;

  FetchArticlesFailure({required this.errorMessage});
}
