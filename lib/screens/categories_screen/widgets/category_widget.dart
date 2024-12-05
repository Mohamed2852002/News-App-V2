import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_v2/cubits/fetch_sources_cubit/fetch_sources_cubit.dart';
import 'package:news_app_v2/models/category_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
      {super.key,
      required this.index,
      required this.categoryModel,
      required this.onTap});
  final int index;
  final CategoryModel categoryModel;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(categoryModel.title);
        BlocProvider.of<FetchSourcesCubit>(context).fetchSources(
          categoryModel.title,
        );
      },
      child: Container(
        height: 171.h,
        width: 148.w,
        decoration: BoxDecoration(
          color: categoryModel.color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
            bottomLeft: Radius.circular(index.isEven ? 25.r : 0),
            bottomRight: Radius.circular(index.isOdd ? 25.r : 0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 120.h,
              width: 120.h,
              child: Image.asset(
                categoryModel.image,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              categoryModel.title,
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontFamily: 'Exo',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
