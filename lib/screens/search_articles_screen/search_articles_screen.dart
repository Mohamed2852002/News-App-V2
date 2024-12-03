import 'package:flutter/material.dart';

class SearchArticlesScreen extends StatelessWidget {
  const SearchArticlesScreen({super.key});

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
        appBar: AppBar(
          title: const TextField(),
        ),
      ),
    );
  }
}
