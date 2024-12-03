import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app_v2/models/articles_response_model/article.dart';
import 'package:news_app_v2/themes/app_colors.dart';
import 'package:timeago/timeago.dart' as timeago;

class CustomArticleWidget extends StatelessWidget {
  const CustomArticleWidget(
      {super.key, required this.articleModel, required this.categoryName});
  final Article articleModel;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5.r),
          child: Hero(
            tag: 'theImage${articleModel.title}',
            child: CachedNetworkImage(
              imageUrl: articleModel.urlToImage ??
                  'https://answers-afd.microsoft.com/static/images/image-not-found.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 230.h,
              placeholder: (context, url) => LoadingAnimationWidget.flickr(
                leftDotColor: Theme.of(context).colorScheme.primary,
                rightDotColor: Colors.yellow,
                size: 45.sp,
              ),
            ),
          ),
        ),
        const RSizedBox(height: 10),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                articleModel.source?.name ?? 'No Source Found',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyFont,
                ),
              ),
              const RSizedBox(height: 5),
              Text(
                articleModel.title ?? 'No Title Found',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const RSizedBox(height: 5),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  timeago.format(
                      DateTime.parse(articleModel.publishedAt ?? '2024-01-01')),
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyFont,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
