import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 46, vertical: 25),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Language'),
          RSizedBox(height: 18),
          DropdownMenu(
            width: double.infinity,
            label: Text('English'),
            dropdownMenuEntries: [
              DropdownMenuEntry<String>(
                value: 'English',
                label: 'English',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
