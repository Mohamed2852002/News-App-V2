import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_v2/models/articles_response_model/article.dart';
import 'package:news_app_v2/screens/category_details_screen/widgets/article_widget.dart';
import 'package:news_app_v2/services/get_articles_service.dart';
import 'package:news_app_v2/widgets/custom_error_widget.dart';
import 'package:news_app_v2/widgets/custom_loading_widget.dart';

class ArticleListView extends StatelessWidget {
  const ArticleListView({super.key, required this.articleId});
  final String articleId;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetArticlesService.getArticles(articleId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CustomLoadingWidget();
        }
        if (snapshot.hasError) {
          return CustomErrorWidget(
            errorMessage: snapshot.data?.errorMessage ?? '',
          );
        }
        List<Article> articles = snapshot.data?.articles ?? [];
        return ListView.separated(
          padding: REdgeInsets.only(top: 22),
          separatorBuilder: (context, index) => const RSizedBox(height: 30),
          itemCount: articles.length,
          itemBuilder: (context, index) => ArticleWidget(
            articleModel: articles[index],
          ),
        );
      },
    );
  }
}
