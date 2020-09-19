import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';

class MealItemDetails extends StatelessWidget {
  static const routeName = '/meal/view/details';
  final Function toggleFavourite;
  final Function isFavourite;
  MealItemDetails(this.toggleFavourite, this.isFavourite);

  Widget buildLists(Widget child, BuildContext context, String title) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: 350,
          decoration: BoxDecoration(
            color: Colors.black54,
            border: Border.all(
              color: Theme.of(context).accentColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: child,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final mealItem = DUMMY_MEALS.firstWhere((item) => item.id == id);
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(mealItem.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: media.height * 0.44,
              width: double.infinity,
              child: Image.network(
                mealItem.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: <Widget>[
                  buildLists(
                    ListView.builder(
                      itemBuilder: (context, i) => Container(
                        margin: const EdgeInsets.all(1),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        color: Colors.black26,
                        child: Text(
                          mealItem.ingredients[i],
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      itemCount: mealItem.ingredients.length,
                    ),
                    context,
                    'Ingredients',
                  ),
                  buildLists(
                    ListView.builder(
                      itemBuilder: (context, i) => Container(
                        color: Colors.black26,
                        margin: const EdgeInsets.all(1),
                        child: ListTile(
                          leading: Container(
                            color: Colors.black87,
                            child: Text(
                              'No ${i + 1}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          title: Text(
                            mealItem.steps[i],
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      itemCount: mealItem.steps.length,
                    ),
                    context,
                    'Steps',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: !isFavourite(id)
            ? Icon(
                Icons.star,
                color: Colors.white,
              )
            : Icon(
                Icons.favorite,
                color: Colors.redAccent,
              ),
        onPressed: () => toggleFavourite(id),
      ),
    );
  }
}
