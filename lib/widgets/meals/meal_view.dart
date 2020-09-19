import 'package:flutter/material.dart';
import './meal_item.dart';
import '../../models/meal.dart';

class MealView extends StatefulWidget {
  static const routeName = '/meals/view';
  final List<Meal> avaliableMeal;
  MealView(this.avaliableMeal);

  @override
  _MealViewState createState() => _MealViewState();
}

class _MealViewState extends State<MealView> {
  String title;
  List<Meal> mealsByCategory;
  bool _loaded = false;

  @override
  void initState() {
    // ... //
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loaded) {
      final routeData =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final id = routeData['id'];
      title = routeData['title'];
      mealsByCategory = widget.avaliableMeal.where((meal) {
        return meal.categories.contains(id);
      }).toList();
    }
    _loaded = true;
    super.didChangeDependencies();
  }

  // void _removeMealFromCategory(String id) {
  //   setState(() {
  //     mealsByCategory.removeWhere((meal) => meal.id == id);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, i) {
          return MealItem(
            mealsByCategory[i].id,
            mealsByCategory[i].title,
            mealsByCategory[i].imageUrl,
            mealsByCategory[i].duration,
            mealsByCategory[i].complexity,
            mealsByCategory[i].affordability,
          );
        },
        itemCount: mealsByCategory.length,
      ),
    );
  }
}
