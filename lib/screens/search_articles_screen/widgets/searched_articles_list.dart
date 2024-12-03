import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_v2/cubits/fetch_searched_articles_cubit/fetch_searched_articles_cubit.dart';
import 'package:news_app_v2/cubits/fetch_searched_articles_cubit/fetch_searched_articles_state.dart';
import 'package:news_app_v2/screens/category_details_screen/widgets/article_widget.dart';
import 'package:news_app_v2/widgets/custom_loading_widget.dart';

class SearchedArticlesList extends StatelessWidget {
  const SearchedArticlesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSearchedArticlesCubit, FetchSearchedArticlesState>(
      builder: (context, state) {
        if (state is FetchSearchedArticlesSuccess) {
          if (state.articles.isEmpty) {
            return Center(
              child: Text(
                'No Articles',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.black,
                    ),
              ),
            );
          } else {
            return Padding(
              padding: REdgeInsets.only(
                top: 8,
                left: 25,
                right: 25,
              ),
              child: ListView.separated(
                padding: REdgeInsets.only(top: 22),
                separatorBuilder: (context, index) =>
                    const RSizedBox(height: 30),
                itemCount: state.articles.length,
                itemBuilder: (context, index) => ArticleWidget(
                  articleModel: state.articles[index],
                  categoryName: state.articles[index].source?.category ?? '',
                ),
              ),
            );
          }
        } else if (state is FetchSearchedArticlesFailure) {
          return Center(
            child: Text(
              'No Articles',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                  ),
            ),
          );
        } else if (state is FetchSearchedArticlesInitial) {
          return Center(
            child: Text(
              'No Articles',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                  ),
            ),
          );
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
