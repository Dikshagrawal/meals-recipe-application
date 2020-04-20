import 'package:flutter/material.dart';
import '../widget/main_widget.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function setFilterScreen;
  final Map<String, bool> currentFilter;

  FilterScreen(this.currentFilter, this.setFilterScreen);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;
  bool _isLactoseFree = false;

  @override
  initState(){
    _isGlutenFree=widget.currentFilter['gluten'];
    _isLactoseFree= widget.currentFilter['lactose'];
    _isVegan=widget.currentFilter['vegan'];
    _isVegetarian= widget.currentFilter['vegetarian'];

    super.initState();

  }



  Widget _buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function UpdateValues) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: UpdateValues,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apply Filters"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: (){
              final selectedFilter={
                'gluten' : _isGlutenFree,
                'lactose' : _isLactoseFree,
                'vegan' : _isVegan,
                'vegetarian' : _isVegetarian
              };
              widget.setFilterScreen(selectedFilter);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust our Meal Selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                    'Gluten Free',
                    'Only Include Gluten-Free Meals',
                    _isGlutenFree,
                    (newValue){
                      setState(() {
                        _isGlutenFree = newValue;
                      });
                    }
                    ),
                _buildSwitchListTile(
                    'Lactose Free',
                    'Only Include Lactose-Free Meals',
                    _isLactoseFree,
                      (newValue){
                      setState(() {
                        _isLactoseFree = newValue;
                      });
                    }),
                _buildSwitchListTile(
                    'Vegetarian',
                    'Only Include Vegetarian Meals',
                    _isVegetarian,
                        (newValue){
                      setState(() {
                        _isVegetarian = newValue;
                      });
                    }),
                _buildSwitchListTile('Vegan',
                    'Only Include Vegan Meals',
                    _isVegan,
                      (newValue){
                      setState(() {
                        _isVegan = newValue;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
