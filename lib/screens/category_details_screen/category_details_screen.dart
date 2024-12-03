import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_v2/cubits/fetch_sources_cubit/fetch_sources_cubit.dart';
import 'package:news_app_v2/cubits/fetch_sources_cubit/fetch_sources_state.dart';
import 'package:news_app_v2/screens/category_details_screen/widgets/article_list_view.dart';
import 'package:news_app_v2/widgets/custom_error_widget.dart';
import 'package:news_app_v2/widgets/custom_loading_widget.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSourcesCubit, FetchSourcesState>(
      builder: (context, state) {
        if (state is FetchSourcesSuccess) {
          return DefaultTabController(
            length: state.sources.length,
            child: Padding(
              padding: REdgeInsets.only(top: 20),
              child: Column(
                children: [
                  TabBar(
                    labelPadding: REdgeInsets.only(right: 14),
                    dividerHeight: 0,
                    indicator: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Theme.of(context).colorScheme.primary,
                    isScrollable: true,
                    tabs: state.sources.map(
                      (source) {
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
                            child: Text(source.name ?? ''),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                  Expanded(
                    child: Padding(
                      padding: REdgeInsets.only(
                        top: 8,
                        left: 25,
                        right: 25,
                      ),
                      child: TabBarView(
                        children: state.sources.map(
                          (source) {
                            return ArticleListView(
                              sourceId: source.id ?? '',
                              categoryName: categoryName,
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
        if (state is FetchSourcesFailure) {
          return CustomErrorWidget(
            errorMessage: state.errorMessage,
            category: categoryName,
          );
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
