import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

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
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
        const RSizedBox(height: 30),
        ListTile(
          title: Text(
            'Categories',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                ),
          ),
          leading: Icon(
            Icons.list,
            size: 40.sp,
          ),
        ),
        ListTile(
          title: Text(
            'Settings',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                ),
          ),
          leading: Icon(
            Icons.settings,
            size: 40.sp,
          ),
        ),
      ],
    );
  }
}
