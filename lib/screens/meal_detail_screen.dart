
import 'package:flutter/material.dart';

import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meals_detail';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget buildTitle(String text, BuildContext context){
    return Container(
            child: Text(text,
            style: Theme.of(context).textTheme.title,
            
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
          );
  }

  Widget buildContainer(Widget child){
    return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 5,
            ),
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 200,
            width: 400,
            child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeals = DUMMY_MEALS.firstWhere((meal) => meal.id== mealId);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeals.title}'),
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(selectedMeals.imageUrl,
              fit: BoxFit.cover,
              ),
            ),
            
            buildTitle('Ingredients', context),
            buildContainer(ListView.builder(
                itemCount: selectedMeals.ingredients.length,
                itemBuilder: (ctx, index) => 
                Card(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                      selectedMeals.ingredients[index],
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      ),
                  ),
                ),
                ),
            ),
            buildTitle('Procedure', context),
            buildContainer(ListView.builder(
              itemCount: selectedMeals.steps.length,
              itemBuilder: (ctx,index) => Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('${index+1}\.'),
                      ),
                    title: Text(selectedMeals.steps[index],),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                ],
              ),
             ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(mealId) ? 
        Icons.star : Icons.star_border),
        backgroundColor: Colors.red[600],
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
