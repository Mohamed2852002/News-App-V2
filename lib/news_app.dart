import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_v2/screens/home/home_screen.dart';
import 'package:news_app_v2/themes/app_theme.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appStyle,
        initialRoute: HomeScreen.routeName,
        routes: {HomeScreen.routeName: (context) => const HomeScreen()},
      ),
    );
  }
}
