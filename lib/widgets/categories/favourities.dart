import 'package:flutter/material.dart';
import '../../models/meal.dart';
import '../meals/meal_item.dart';

class Favourties extends StatelessWidget {
  final List<Meal> favouriteMeal;
  Favourties(this.favouriteMeal);

  @override
  Widget build(BuildContext context) {
    return favouriteMeal.length == 0
        ? Center(
            child: Text("No favorite meal added yet",
                style: TextStyle(
                  fontSize: 18,
                )),
          )
        : ListView.builder(
            itemBuilder: (context, i) {
              return MealItem(
                favouriteMeal[i].id,
                favouriteMeal[i].title,
                favouriteMeal[i].imageUrl,
                favouriteMeal[i].duration,
                favouriteMeal[i].complexity,
                favouriteMeal[i].affordability,
              );
            },
            itemCount: favouriteMeal.length,
          );
  }
}
