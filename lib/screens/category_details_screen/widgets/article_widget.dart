import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:news_app_v2/models/article_model.dart';
import 'package:news_app_v2/themes/app_colors.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({super.key, required this.articleModel});
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5.r),
          child: Image.network(
            articleModel.image ??
                'https://answers-afd.microsoft.com/static/images/image-not-found.jpg',
            fit: BoxFit.cover,
            width: 360.w,
            height: 230.h,
          ),
        ),
        const RSizedBox(height: 10),
        Text(
          articleModel.source ?? '',
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.greyFont,
          ),
        ),
        const RSizedBox(height: 5),
        Text(
          articleModel.title ?? '',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        const RSizedBox(height: 5),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            timeago.format(DateTime.parse(articleModel.date ?? '2024-1-1')),
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.greyFont,
            ),
          ),
        ),
      ],
    );
  }
}
