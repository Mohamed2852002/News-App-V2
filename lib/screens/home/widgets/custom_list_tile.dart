import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key, required this.text, required this.icon, required this.onTap});
  final String text;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap();
      },
      title: Text(
        text,
        style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      leading: Icon(
        icon,
        size: 40.sp,
      ),
    );
  }
}
