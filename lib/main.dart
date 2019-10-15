import 'package:flutter/material.dart';

import './pages/tabs.dart';
import './pages/category_meals.dart';
import './pages/meal-detail.dart';
import './pages/filters.dart';

import './models/Meal.dart';
import './dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutenFree': false,
    'vegan': false,
    'vegetarian': false,
    'lactoseFree': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['glutenFree'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['lactoseFree'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.lime,
        accentColor: Colors.indigo,
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
        '/': (ctx) => TabsPage(),
        CategoryMealsPage.routeName: (ctx) =>
            CategoryMealsPage(_availableMeals),
        MealDetail.routeName: (ctx) => MealDetail(),
        FiltersPage.routeName: (ctx) => FiltersPage(_filters, _setFilter),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => TabsPage());
      },
    );
  }
}
