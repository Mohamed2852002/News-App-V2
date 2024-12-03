import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_v2/cubits/fetch_articles_cubit/fetch_articles_state.dart';
import 'package:news_app_v2/services/get_articles_service.dart';

class FetchArticlesCubit extends Cubit<FetchArticlesState> {
  FetchArticlesCubit() : super(FetchArticlesInitial());
  fetchArticles(String sourceId) async {
    emit(FetchArticlesLoading());
    var data = await GetArticlesService.getArticles(sourceId);
    data.fold(
      (failure) {
        emit(FetchArticlesFailure(errorMessage: failure.errorMessage));
      },
      (articlesList) {
        emit(FetchArticlesSuccess(articles: articlesList.articles ?? []));
      },
    );
  }
}
