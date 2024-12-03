import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_v2/models/articles_response_model/article.dart';
import 'package:news_app_v2/screens/article_details_screen/widgets/article_info_widget.dart';
import 'package:news_app_v2/screens/article_details_screen/widgets/custom_article_widget.dart';

class ArticleDetailsWidget extends StatelessWidget {
  const ArticleDetailsWidget(
      {super.key, required this.article, required this.categoryName});
  final Article article;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomArticleWidget(
          articleModel: article,
          categoryName: categoryName,
        ),
        const RSizedBox(height: 18),
        ArticleInfoWidget(article: article),
      ],
    );
  }
}
