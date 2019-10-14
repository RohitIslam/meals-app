import 'package:flutter/material.dart';

import './pages/categories.dart';
import './pages/category_meals.dart';
import './pages/meal-detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.lime,
        accentColor: Colors.orangeAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: '/', // this route is the home route or default route
      routes: {
        '/': (ctx) => CategoriesPage(),
        CategoryMealsPage.routeName: (ctx) => CategoryMealsPage(),
        MealDetail.routeName: (ctx) => MealDetail(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesPage());
      },
    );
  }
}
