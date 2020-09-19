import 'package:flutter/material.dart';
import './meal_categories.dart';
import './favourities.dart';
import './drawer/main_drawer.dart';
import '../../models/meal.dart';
// import './widgets/tabs/categories.dart';

class Tabs extends StatefulWidget {
  final List<Meal> favouriteMeal;
  Tabs(this.favouriteMeal);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': MealCategories(), 'title': 'Categories'},
      {'page': Favourties(widget.favouriteMeal), 'title': 'Favourite'},
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'],
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: MainDrawer(),
        ),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favourites'),
          ),
        ],
      ),
    );
  }
}
