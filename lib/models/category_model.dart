import 'package:flutter/material.dart';

class CategoryModel {
  final String title;
  final String image;
  final Color color;

  CategoryModel(
      {required this.title, required this.image, required this.color});

  static List<CategoryModel> categories = [
    CategoryModel(
        title: 'Sports',
        image: 'assets/images/sports.png',
        color: const Color(0xffC91C22)),
    CategoryModel(
        title: 'General',
        image: 'assets/images/Politics.png',
        color: const Color(0xff003E90)),
    CategoryModel(
        title: 'Health',
        image: 'assets/images/health.png',
        color: const Color(0xffED1E79)),
    CategoryModel(
        title: 'Business',
        image: 'assets/images/bussines.png',
        color: const Color(0xffCF7E48)),
    CategoryModel(
        title: 'Entertainment',
        image: 'assets/images/environment.png',
        color: const Color(0xff4882CF)),
    CategoryModel(
        title: 'Science',
        image: 'assets/images/science.png',
        color: const Color(0xffF2D352)),
  ];
}
