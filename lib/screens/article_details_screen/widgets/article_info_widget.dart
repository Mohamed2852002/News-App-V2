// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_v2/helper/custom_snack_bar.dart';
import 'package:news_app_v2/models/articles_response_model/article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleInfoWidget extends StatelessWidget {
  const ArticleInfoWidget({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.symmetric(
        horizontal: 26,
      ),
      padding: REdgeInsets.symmetric(horizontal: 12, vertical: 24),
      width: double.infinity,
      height: 370.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          25.r,
        ),
      ),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  article.content ?? 'There\'s No Content',
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      launchArticleUrl(article.url ?? '', context);
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'View Full Article',
                        ),
                        RSizedBox(width: 6),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> launchArticleUrl(String url, BuildContext context) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.inAppWebView);
    } else {
      showCustomSnackBar(context, 'Couldn\'t Launch Url');
    }
  }
}
