import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
   static const routeName ='/filters'; 

  final Function savefilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters,this.savefilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegetarian = false;
  var _vegan = false;

  @override
  initState(){
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();

  }

  Widget _buildSwitchListTile(String title, String subtitle, var currentValue, Function updateValue){
    return SwitchListTile(
                    title: Text(title),
                    value: currentValue,
                    subtitle: Text(subtitle),
                    onChanged: updateValue,
                  );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Favoutites'),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.save),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                final selecedFilters = {
                  'gluten': _glutenFree,
                  'vegan': _vegan,
                  'lactose' : _lactoseFree,
                  'vegetarian' : _vegetarian,
  };
                widget.savefilters(selecedFilters);
              },
              )
            ],
          ),
          drawer: MainDrawer(),
          body: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text('Adjust meals',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                 _buildSwitchListTile(
                   'Gluten_free',
                   'only include gluten_free',
                   _glutenFree,
                   (newValue) {
                     setState(() {
                       _glutenFree = newValue;
                     });
                   }
                 ),
                 _buildSwitchListTile(
                   'Lactose_free',
                   'only include lactose_free',
                   _lactoseFree,
                   (newValue) {
                     setState(() {
                       _lactoseFree = newValue;
                     });
                   }
                 ),
                 _buildSwitchListTile(
                   'vegan',
                   'only include vegan',
                   _vegan,
                   (newValue) {
                     setState(() {
                       _vegan = newValue;
                     });
                   }
                 ),
                 _buildSwitchListTile(
                   'GVegetarian',
                   'only include gVegetarian',
                   _vegetarian,
                   (newValue) {
                     setState(() {
                       _vegetarian = newValue;
                     });
                   }
                 ),
                ],
              ),
            ),
          ],),
    );
  }
}