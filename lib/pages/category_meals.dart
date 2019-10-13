import 'package:flutter/material.dart';

class CategoryMealsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category Name"),
      ),
      body: Center(
        child: Text(
          'The Recipes',
        ),
      ),
    );
  }
}
