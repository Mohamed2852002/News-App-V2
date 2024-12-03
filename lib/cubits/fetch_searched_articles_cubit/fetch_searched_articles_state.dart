import 'package:news_app_v2/models/articles_response_model/article.dart';

class FetchSearchedArticlesState {}

final class FetchSearchedArticlesInitial extends FetchSearchedArticlesState {}

final class FetchSearchedArticlesLoading extends FetchSearchedArticlesState {}

final class FetchSearchedArticlesSuccess extends FetchSearchedArticlesState {
  final List<Article> articles;

  FetchSearchedArticlesSuccess({required this.articles});
}

final class FetchSearchedArticlesFailure extends FetchSearchedArticlesState {
  final String errorMessage;

  FetchSearchedArticlesFailure({required this.errorMessage});
}
