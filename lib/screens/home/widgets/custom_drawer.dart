import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_v2/screens/home/home_screen.dart';
import 'package:news_app_v2/screens/home/widgets/custom_list_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.onTap});
  final Function(DrawerTabs) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 140.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Center(
            child: Text(
              'News App!',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const RSizedBox(height: 30),
        CustomListTile(
          text: 'Categories',
          icon: Icons.list,
          onTap: () {
            onTap(DrawerTabs.categories);
          },
        ),
        CustomListTile(
          text: 'Settings',
          icon: Icons.settings,
          onTap: () {
            onTap(DrawerTabs.settings);
          },
        ),
      ],
    );
  }
}
