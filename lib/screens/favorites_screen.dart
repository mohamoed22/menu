import 'package:flutter/material.dart';

import '../Moduls/meal.dart';
import '../widgets/meal_item.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class FavoritesScreen extends StatelessWidget {
  // ignore: prefer_final_fields
  List<Meal> _favoriteMeals;
  // ignore: use_key_in_widget_constructors
  FavoritesScreen(this._favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (_favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You have on favorites yet - sart adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _favoriteMeals[index].id,
            title: _favoriteMeals[index].title,
            imageUrl: _favoriteMeals[index].imageUrl,
            duration: _favoriteMeals[index].duration,
            affordability: _favoriteMeals[index].affordability,
            complexity: _favoriteMeals[index].complexity,
            //removeIteim: _favoriteMeals,
          );
        },
        itemCount: _favoriteMeals.length,
      );
    }
  }
}



/*const Center(
      child: Text('You have on favorites yet - sart adding some!'),
    );

   */