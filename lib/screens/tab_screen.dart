import 'package:flutter/material.dart';
import './category_screen.dart';
import './favorites_screen.dart';
import '../widget/main_widget.dart';
import '../models/meals.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List<Map<String, Object>> _pages;
   int _selectedPageIndex=0;

  void initState(){
    _pages=[
      {'page' :CategoriesScreen(), 'title':"Categories"},
      {'page' :FavoriteScreen(widget.favoriteMeals), 'title':"Your Favorites"},
    ];
  }
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // to make down tabscreen
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          backgroundColor: Theme.of(context).primaryColor,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title:Text("Categories"),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite),
              title:Text("Favorites"),
            )
          ]),
    );



//    to make above tabscreen
//    return DefaultTabController(
//      length: 2,
//      initialIndex: 0,
//      child: Scaffold(
//        appBar: AppBar(
//          title: Text("DeliMeals"),
//          bottom: TabBar(tabs: <Widget>[
//            Tab(icon: Icon(Icons.category), text: 'Categories',),
//            Tab(icon: Icon(Icons.favorite), text: 'Favorites',)
//          ]),
//        ),
//        body: TabBarView(children: <Widget>[
//          CategoriesScreen(),
//          FavoritesScreen()
//        ]),
//      ),
//    );


  }
}
