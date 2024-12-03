import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_v2/cubits/fetch_articles_cubit/fetch_articles_cubit.dart';
import 'package:news_app_v2/cubits/fetch_articles_cubit/fetch_articles_state.dart';
import 'package:news_app_v2/screens/category_details_screen/widgets/article_widget.dart';
import 'package:news_app_v2/widgets/custom_error_widget.dart';
import 'package:news_app_v2/widgets/custom_loading_widget.dart';

class ArticleListView extends StatelessWidget {
  const ArticleListView(
      {super.key, required this.sourceId, required this.categoryName});
  final String sourceId;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FetchArticlesCubit>(context).fetchArticles(sourceId);

    return BlocBuilder<FetchArticlesCubit, FetchArticlesState>(
      builder: (context, state) {
        if (state is FetchArticlesSuccess) {
          return ListView.separated(
            padding: REdgeInsets.only(top: 22),
            separatorBuilder: (context, index) => const RSizedBox(height: 30),
            itemCount: state.articles.length,
            itemBuilder: (context, index) => ArticleWidget(
              articleModel: state.articles[index],
              categoryName: categoryName,
            ),
          );
        } else if (state is FetchArticlesFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
