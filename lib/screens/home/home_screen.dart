import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_v2/screens/categories_screen/categories_screen.dart';
import 'package:news_app_v2/screens/category_details_screen/category_details_screen.dart';
import 'package:news_app_v2/screens/home/widgets/custom_drawer.dart';
import 'package:news_app_v2/screens/search_articles_screen/search_articles_screen.dart';
import 'package:news_app_v2/screens/settings_screen/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget selectedWidget;
  late String selectedTitle;
  @override
  void initState() {
    selectedWidget = CategoriesScreen(
      onTap: (title) {
        setState(() {
          selectedTitle = title;
          selectedWidget = CategoryDetailsScreen(categoryName: title);
        });
      },
    );
    selectedTitle = 'News App';
    super.initState();
  }

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
        drawer: Drawer(
          
          child: CustomDrawer(
            onTap: (tabs) {
              showSelectedTab(tabs);
              showSelectedTabTitle(tabs);
            },
          ),
        ),
        appBar: AppBar(
          leadingWidth: 80.w,
          leading: Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: REdgeInsets.only(left: 24),
                child: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              );
            },
          ),
          title: Text(selectedTitle),
          actions: [
            selectedWidget.runtimeType == CategoryDetailsScreen
                ? IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchArticlesScreen(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.search,
                      size: 40.sp,
                    ),
                  )
                : const RSizedBox(),
            const RSizedBox(width: 40),
          ],
        ),
        body: selectedWidget,
      ),
    );
  }

  showSelectedTab(DrawerTabs tabs) {
    switch (tabs) {
      case DrawerTabs.categories:
        setState(
          () {
            selectedWidget = CategoriesScreen(
              onTap: (title) {
                setState(() {
                  selectedTitle = title;
                  selectedWidget = CategoryDetailsScreen(categoryName: title);
                });
              },
            );
          },
        );
        Navigator.pop(context);
      case DrawerTabs.settings:
        setState(
          () {
            selectedWidget = const SettingsScreen();
          },
        );
        Navigator.pop(context);
    }
  }

  showSelectedTabTitle(DrawerTabs tabs) {
    switch (tabs) {
      case DrawerTabs.categories:
        setState(
          () {
            selectedTitle = 'News App';
          },
        );
      case DrawerTabs.settings:
        setState(
          () {
            selectedTitle = 'Settings';
          },
        );
    }
  }
}

enum DrawerTabs {
  categories,
  settings,
}
