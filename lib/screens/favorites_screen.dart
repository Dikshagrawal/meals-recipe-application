import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import '../widget/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;
  FavoriteScreen(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeal.isEmpty)
    return Center(
      child: Text("You don't have any favorites. Start adding some!") ,
    );
    else{
      return ListView.builder(itemBuilder: (context, index){
        return MealItem(
          id: favoriteMeal[index].id,
          title: favoriteMeal[index].title,
          imageUrl: favoriteMeal[index].imageUrl,
          affordability: favoriteMeal[index].affordability,
          complexity: favoriteMeal[index].complexity,
          duration: favoriteMeal[index].duration,
        );
      }, itemCount: favoriteMeal.length,);
    }
  }
}