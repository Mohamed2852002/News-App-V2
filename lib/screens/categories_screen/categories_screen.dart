import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_v2/models/category_model.dart';
import 'package:news_app_v2/screens/categories_screen/widgets/category_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onTap});
  final Function(String) onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '''Pick your category 
of interest''',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const RSizedBox(height: 30),
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: CategoryModel.categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 171.h,
                crossAxisCount: 2,
                crossAxisSpacing: 25.w,
                mainAxisSpacing: 20.h,
                childAspectRatio: 1 / 1,
              ),
              itemBuilder: (BuildContext context, int index) => CategoryWidget(
                onTap: (title) {
                  onTap(title);
                },
                index: index,
                categoryModel: CategoryModel.categories[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
