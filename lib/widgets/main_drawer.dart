import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(
    String text, 
    IconData icon, 
    BuildContext context,
    Function tapHandler,) {
    return ListTile(
          leading: Icon(
            icon,
            size: 26,
            ),
            title: Text(text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor,
                fontFamily: 'RobodoCondensed',
              ),
            ),
            onTap: tapHandler,
        ); 
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        Container(
          height: 100,
          width: double.infinity,
          padding: EdgeInsets.all(15),
          alignment: Alignment.centerLeft,
          color: Colors.teal,
          child: Text('Hurry Up!!!',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        buildListTile(
          'Meals', 
          Icons.restaurant, 
          context,
          () {
            Navigator.of(context).pushReplacementNamed('/');
          },
          ),
        buildListTile(
          'Filters', 
          Icons.settings, 
          context,
          () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          },
          ),
      ],),
    );
  }
}