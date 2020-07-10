import 'package:flutter/material.dart';

import '../screens/meal_detail_screen.dart';
import '../models/meals.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
 

  MealItem({
 
    @required this.id,
    @required this.affordability,
    @required this.complexity,
    @required this.imageUrl,
    @required this.title,
    @required this.duration,
  });

  String get complexityText {
    switch(complexity) {
      case Complexity.Simple:
      return 'Simple';
      break;
      case Complexity.Hard:
      return 'Hard';
      break;
      case Complexity.Challenging:
      return 'Challenging';
      break;
      default:
      return 'Unknown';
    }
  }

  String get affordabilityText{
    switch(affordability) {
      case Affordability.Affordable:
      return 'Affordable';
      break;
      case Affordability.Luxurious:
      return 'Expensive';
      break;
      case Affordability.Pricey:
      return 'Pricey';
      break;
      default:
      return 'Unknown';
    }
  }

  void selectMeal(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
      ).then((result){
        if(result != null){
          //removeItem (result);
        }
      });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        margin: EdgeInsets.all(15),
        child: Column(children: <Widget>[
          Stack(children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                imageUrl ,
                height: 220, 
                width: double.infinity, 
                fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Container(
                  color: Colors.black26,
                  width: 200,
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                   ),
                   softWrap: true,
                   overflow: TextOverflow.fade,
                  ),
                ),
              ),
          ],),
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
              Row(children: <Widget>[
                Icon(Icons.schedule),
                SizedBox(width: 5,),
                Text('$duration min'),
              ],),
              Row(children: <Widget>[
                Icon(Icons.work),
                SizedBox(width: 5,),
                Text(complexityText),
              ],),
              Row(children: <Widget>[
                Icon(Icons.attach_money),
                //SizedBox(width: 2,),
                Text(affordabilityText),
              ],)
            ],),
          )
        ],),
      ),
    );
  }
}