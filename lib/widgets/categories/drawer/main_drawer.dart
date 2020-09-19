import 'package:flutter/material.dart';
import '../meal_filter.dart';

class MainDrawer extends StatelessWidget {
  Widget _listStyle(String title, IconData icon, Function _onTapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: _onTapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100,
          width: double.infinity,
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.only(top: 0, bottom: 20, left: 20),
          color: Theme.of(context).primaryColor,
          child: Text(
            "Sweet Meal APP",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 28,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        _listStyle("Meals", Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        _listStyle("Filters", Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(MealFilter.routeName);
        }),
      ],
    );
  }
}
