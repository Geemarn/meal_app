import 'package:flutter/material.dart';
import '../../models/meal.dart';
import './meal_item_details.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String image;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem(
    this.id,
    this.title,
    this.image,
    this.duration,
    this.complexity,
    this.affordability,
  );

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Can not say';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

  Widget _rowBuilder(String title, IconData icon) {
    return Row(
      children: <Widget>[
        Icon(icon),
        SizedBox(width: 7),
        Text(title),
      ],
    );
  }

  _pushMealItem(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealItemDetails.routeName,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        print(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _pushMealItem(context),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    image,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    width: 300,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      color: Colors.black54,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _rowBuilder('$duration mins', Icons.schedule),
                  _rowBuilder(complexityText, Icons.work),
                  _rowBuilder(affordabilityText, Icons.attach_money),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
