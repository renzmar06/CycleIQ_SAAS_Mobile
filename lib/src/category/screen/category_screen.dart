import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryName;

  const CategoryScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryName), backgroundColor: Colors.green),
      body: Center(
        child: Text(
          "Items under $categoryName",
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
