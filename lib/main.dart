// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import 'Moduls/meal.dart';
import 'dummy_data .dart';
import 'screens/Filters_ sceern.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
// ignore: unused_element, unused_field
  Map<String, bool> _feltaers = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availapleMeals = DUMMY_MEALS;
  // ignore: prefer_final_fields
  List<Meal> _favoriteMeals = [];

  void _setfeltaers(Map<String, bool> feltaerDate) {
    setState(() {
      _feltaers = feltaerDate;

      _availapleMeals = DUMMY_MEALS.where((meal) {
        if (_feltaers['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_feltaers['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_feltaers['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_feltaers['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String maelid) {
    // ignore: unused_local_variable, no_leading_underscores_for_local_identifiers
    final _exssedeindex =
        _favoriteMeals.indexWhere((mael) => mael.id == maelid);
    if (_exssedeindex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(_exssedeindex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == maelid));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id ==  id );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        hintColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            subtitle1: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availapleMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite,_isMealFavorite),
        FiltersSceern.routName: (ctx) => FiltersSceern(_setfeltaers, _feltaers)
      },

      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => const CategoriesScreen(),
        );
      },
    );
  }
}
