import 'package:flutter/material.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(IconData icon, String tileName, Function tapHandler ){
    return ListTile(
      leading: Icon(icon, size:26,),
      title: Text(
        tileName,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 120,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text("Cooking", style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
            ),)
          ),
          SizedBox(height: 20,),
          buildListTile(Icons.restaurant, "Restaurant", (){
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile(Icons.settings, "Filters", (){
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
