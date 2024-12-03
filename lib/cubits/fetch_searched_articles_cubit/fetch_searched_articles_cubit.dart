import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_v2/cubits/fetch_searched_articles_cubit/fetch_searched_articles_state.dart';
import 'package:news_app_v2/services/search_article_service.dart';

class FetchSearchedArticlesCubit extends Cubit<FetchSearchedArticlesState> {
  FetchSearchedArticlesCubit() : super(FetchSearchedArticlesInitial());
  fetchSearchedArticles(String searchKey) async {
    emit(FetchSearchedArticlesLoading());
    var data = await SearchArticleService.getSearchedArticles(searchKey);
    data.fold(
      (failure) {
        emit(FetchSearchedArticlesFailure(errorMessage: failure.errorMessage));
      },
      (articlesList) {
        emit(FetchSearchedArticlesSuccess(
            articles: articlesList.articles ?? []));
      },
    );
  }
}
