import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_v2/models/articles_response_model/article.dart';
import 'package:news_app_v2/screens/article_details_screen/widgets/article_info_widget.dart';
import 'package:news_app_v2/screens/category_details_screen/widgets/article_widget.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen(
      {super.key, required this.article, required this.categoryName});
  final Article article;
  final String categoryName;

  static const String routeName = 'articleDetails';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/pattern.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(categoryName),
        ),
        body: Padding(
          padding: REdgeInsets.only(
            top: 30,
            left: 26,
            right: 26,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ArticleWidget(
                articleModel: article,
                categoryName: categoryName,
              ),
              const RSizedBox(height: 20),
              ArticleInfoWidget(article: article),
            ],
          ),
        ),
      ),
    );
  }
}
