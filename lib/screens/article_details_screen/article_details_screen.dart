import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_v2/models/articles_response_model/article.dart';
import 'package:news_app_v2/screens/article_details_screen/widgets/article_details_widget.dart';

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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(categoryName),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const RSizedBox(height: 28),
                  ArticleDetailsWidget(
                    article: article,
                    categoryName: categoryName,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
