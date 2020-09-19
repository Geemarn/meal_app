import 'package:flutter/material.dart';
import './drawer/main_drawer.dart';

class MealFilter extends StatefulWidget {
  static const routeName = '/meal-filter';
  final Function saveFilter;
  final Map<String, bool> alreadyFiltered;
  MealFilter(this.alreadyFiltered, this.saveFilter);

  @override
  _MealFilterState createState() => _MealFilterState();
}

class _MealFilterState extends State<MealFilter> {
  bool _gluttenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegeterian = false;

  @override
  initState() {
    _gluttenFree = widget.alreadyFiltered['glutten'];
    _lactoseFree = widget.alreadyFiltered['lactose'];
    _vegan = widget.alreadyFiltered['vegan'];
    _vegeterian = widget.alreadyFiltered['vegetarain'];
    super.initState();
  }

  Widget _switches(
    String title,
    String subTitle,
    bool boolValue,
    Function updatedVal,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: boolValue,
      subtitle: Text(subTitle),
      onChanged: updatedVal,
    );
  }

  void handleFilter() {
    final _selectedFilters = {
      'glutten': _gluttenFree,
      'lactose': _lactoseFree,
      'vegan': _vegan,
      'vegetarain': _vegeterian,
    };

    widget.saveFilter(_selectedFilters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtered meal'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save_alt),
            onPressed: handleFilter,
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: MainDrawer(),
        ),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              padding: const EdgeInsets.all(30),
              child: Text(
                "Adjust meals selection",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _switches(
                  'Glutten free',
                  'Only include glutten-free meals',
                  _gluttenFree,
                  (selected) {
                    setState(() {
                      _gluttenFree = selected;
                    });
                  },
                ),
                _switches(
                  'Lactose free',
                  'Only include lactose-free meals',
                  _lactoseFree,
                  (selected) {
                    setState(() {
                      _lactoseFree = selected;
                    });
                  },
                ),
                _switches(
                  'Vegetarian',
                  'Only include vegeterian meals',
                  _vegeterian,
                  (selected) {
                    setState(() {
                      _vegeterian = selected;
                    });
                  },
                ),
                _switches(
                  'Vegan',
                  'Only include vegan meals',
                  _vegan,
                  (selected) {
                    setState(() {
                      _vegan = selected;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
