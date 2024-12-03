import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_v2/cubits/fetch_articles_cubit/fetch_articles_cubit.dart';
import 'package:news_app_v2/cubits/fetch_sources_cubit/fetch_sources_cubit.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(
      {super.key, required this.errorMessage, this.category, this.sourceId});
  final String errorMessage;
  final String? sourceId;
  final String? category;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.black,
                ),
          ),
          const RSizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {
              BlocProvider.of<FetchArticlesCubit>(context)
                  .fetchArticles(sourceId ?? '');
              BlocProvider.of<FetchSourcesCubit>(context)
                  .fetchSources(category ?? '');
            },
            child: Text(
              'Try Again',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
