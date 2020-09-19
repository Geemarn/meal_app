import 'package:flutter/material.dart';
import './widgets/categories/meal_filter.dart';
import './widgets/categories/tabs.dart';
import './widgets/categories/meal_categories.dart';
import './widgets/meals/meal_view.dart';
import './data/dummy_data.dart';
import './models/meal.dart';
import './widgets/meals/meal_item_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutten': false,
    'lactose': false,
    'vegan': false,
    'vegetarain': false,
  };

  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favouriteMeal = [];

  bool _isFavourite(String favoriteId) {
    return _favouriteMeal.any((meal) => meal.id == favoriteId);
  }

  void _toggleFavourite(String favoriteId) {
    final existingIndex =
        _favouriteMeal.indexWhere((meal) => meal.id == favoriteId);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeal
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == favoriteId));
      });
    }
  }

  void _saveFilter(Map<String, bool> filteredData) {
    setState(() {
      _filters = filteredData;
      _availableMeal = DUMMY_MEALS.where((meal) {
        if (_filters['glutten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarain'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData(
        primaryColor: const Color(0xff7F7AFB),
        accentColor: const Color(0xffF6C456),
        canvasColor: const Color(0xff7F7AFB),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
              fontSize: 24,
              fontFamily: 'RobotoCondensed',
            )),
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MealCategories(),
      initialRoute: '/',
      routes: {
        '/': (context) => Tabs(_favouriteMeal),
        MealView.routeName: (context) => MealView(_availableMeal),
        MealItemDetails.routeName: (context) =>
            MealItemDetails(_toggleFavourite, _isFavourite),
        MealFilter.routeName: (context) => MealFilter(_filters, _saveFilter),
      },
      // onGenerateRoute: (settings) {},
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => MealCategories());
      },
    );
  }
}
