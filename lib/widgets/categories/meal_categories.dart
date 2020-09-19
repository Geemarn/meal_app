import 'package:flutter/material.dart';
import './meal_categories_item.dart';
import '../../data/dummy_data.dart';

class MealCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/food.jpg'),
          fit: BoxFit.contain,
        ),
        color: Colors.white,
      ),
      child: GridView(
        padding: const EdgeInsets.all(10),
        children: DUMMY_DATA
            .map(
              (D) => MealCategoriesItem(
                D.title,
                D.id,
                D.color,
              ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
