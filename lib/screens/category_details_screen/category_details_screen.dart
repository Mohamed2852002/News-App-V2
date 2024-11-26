import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_v2/models/article_model.dart';
import 'package:news_app_v2/screens/category_details_screen/widgets/article_widget.dart';
import 'package:news_app_v2/services/get_news_service.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({super.key, required this.categoryName});
  final String categoryName;
  final List<String> sources = const [
    'BBC News',
    'asf',
    'dfh',
    'dwqr',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: sources.length,
      child: Padding(
        padding: REdgeInsets.only(
          top: 20,
          left: 25,
          right: 25,
        ),
        child: Column(
          children: [
            TabBar(
              dividerHeight: 0,
              indicator: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(25.r),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Theme.of(context).colorScheme.primary,
              isScrollable: true,
              tabs: sources.map(
                (e) {
                  return Tab(
                    child: Container(
                      padding: REdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2.w,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      child: Text(e),
                    ),
                  );
                },
              ).toList(),
            ),
            Expanded(
              child: TabBarView(
                  children: sources.map(
                (e) {
                  return FutureBuilder(
                    future: GetNewsService.getNews(category: categoryName),
                    builder: (context, snapshot) {
                      List<ArticleModel> articles = snapshot.data ?? [];
                      return ListView.separated(
                        padding: REdgeInsets.only(top: 30),
                        separatorBuilder: (context, index) =>
                            const RSizedBox(height: 30),
                        itemCount: articles.length,
                        itemBuilder: (context, index) => ArticleWidget(
                          articleModel: articles[index],
                        ),
                      );
                    },
                  );
                },
              ).toList()
                  // [

                  //   ArticleWidget(
                  //     articleModel: ArticleModel(
                  //       title: 'title',
                  //       source: 'source',
                  //       image: 'image',
                  //       date: DateTime.now(),
                  //       siteUrl: '',
                  //     ),
                  //   ),
                  //   Text(sources[1]),
                  //   Text(sources[1]),
                  //   Text(sources[1]),
                  // ],
                  ),
            )
          ],
        ),
      ),
    );
  }
}
