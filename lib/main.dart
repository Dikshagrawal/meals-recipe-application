import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meals.dart';
import './screens/filters_screen.dart';
import './screens/tab_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters={
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List <Meal> _availableMeals = DUMMY_MEALS;
  List <Meal> _favoriteMeals =[];

  void _setFilters(Map<String, bool> filterData){
    setState(() {
      _filters=filterData;
      _availableMeals=DUMMY_MEALS.where((Meal){
        if(_filters['gluten'] && !Meal.isGlutenFree)
          return false;
        if(_filters['lactose'] && !Meal.isLactoseFree)
          return false;
        if(_filters['vegan'] && !Meal.isVegan)
          return false;
        if(_filters['vegetarian'] && !Meal.isVegetarian)
          return false;
        return true;
      }).toList();
    });
  }

  bool _isMealFavorite(String id){
    return _favoriteMeals.any((meal)=> meal.id == id);
  }

  void _toggleFavorite(String mealId){
    final existingIndex=_favoriteMeals.indexWhere((meal)=> meal.id == mealId);
    if(existingIndex >= 0)
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    else{
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal)=> meal.id==mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        //canvasColor: Color.fromRGBO(255, 2254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            title: TextStyle(
              fontSize: 20,
              fontFamily: "RobotoCondensed",
              fontWeight: FontWeight.bold
          )
        ),
      ),
      //home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/' : (ctx)=> TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FilterScreen.routeName: (ctx) => FilterScreen(_filters, _setFilters),
      },
//      onGenerateRoute: (settings){
//        print(settings.arguments);
//        return MaterialPageRoute(builder: (ctx)=> CategoriesScreen());
//      },
//      onUnknownRoute: (settings){
//        return MaterialPageRoute(builder: (ctx)=> CategoriesScreen());
//      },
    );
  }
}
