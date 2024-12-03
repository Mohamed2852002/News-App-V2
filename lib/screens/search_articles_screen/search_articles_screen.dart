import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_v2/cubits/fetch_searched_articles_cubit/fetch_searched_articles_cubit.dart';
import 'package:news_app_v2/screens/search_articles_screen/widgets/searched_articles_list.dart';

class SearchArticlesScreen extends StatefulWidget {
  const SearchArticlesScreen({super.key});

  @override
  State<SearchArticlesScreen> createState() => _SearchArticlesScreenState();
}

class _SearchArticlesScreenState extends State<SearchArticlesScreen> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchSearchedArticlesCubit(),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/pattern.png'),
          ),
        ),
        child: Builder(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                toolbarHeight: 97.h,
                automaticallyImplyLeading: false,
                title: TextField(
                  controller: controller,
                  onSubmitted: (value) {
                    BlocProvider.of<FetchSearchedArticlesCubit>(context)
                        .fetchSearchedArticles(value);
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        BlocProvider.of<FetchSearchedArticlesCubit>(context)
                            .fetchSearchedArticles(controller.text);
                      },
                      icon: Icon(
                        Icons.search,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    prefixIcon: IconButton(
                      onPressed: () {
                        controller.clear();
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    hintText: 'Search Article',
                  ),
                ),
              ),
              body: const SearchedArticlesList(),
            );
          },
        ),
      ),
    );
  }
}
