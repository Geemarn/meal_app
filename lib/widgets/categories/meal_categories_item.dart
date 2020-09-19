import 'package:flutter/material.dart';
import '../meals/meal_view.dart';

class MealCategoriesItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  MealCategoriesItem(this.title, this.id, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            MealView.routeName,
            arguments: {'id': id, 'title': title},
          );
        },
        splashColor: Theme.of(context).accentColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 24,
              color: Colors.black87,
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              color.withOpacity(0.6),
              color.withOpacity(0.9),
              color.withOpacity(0),
              color.withOpacity(0.9),
              color.withOpacity(0.6),
            ],
            // begin: Alignment.topLeft,
            // end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
