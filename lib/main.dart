import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_v2/cubits/fetch_articles_cubit/fetch_articles_cubit.dart';
import 'package:news_app_v2/cubits/fetch_sources_cubit/fetch_sources_cubit.dart';
import 'package:news_app_v2/screens/home/home_screen.dart';
import 'package:news_app_v2/themes/app_theme.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => FetchSourcesCubit()),
          BlocProvider(create: (context) => FetchArticlesCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appStyle,
          initialRoute: HomeScreen.routeName,
          routes: {
            HomeScreen.routeName: (context) => const HomeScreen(),
          },
        ),
      ),
    );
  }
}
