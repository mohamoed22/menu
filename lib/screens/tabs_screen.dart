// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../Moduls/meal.dart';
import '../widgets/tabs_Drewae.dart';
import './categories_screen.dart';
import 'favorites_screen.dart';

// ignore: must_be_immutable
class TabsScreen extends StatefulWidget {
  // ignore: prefer_final_fields
  List<Meal> _favoriteMeals;
  TabsScreen(this._favoriteMeals);
  @override
  // ignore: library_private_types_in_public_api
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   late List<Map<String, Object>> _pages ; 
   int _selectedPageIndex = 0;
   @override
  void initState() {
    _pages=  [
    {
      'page': const CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoritesScreen(widget._favoriteMeals),
      'title': 'Your Favorite',
    },
  ];
    super.initState();
  }
   
 
  
  

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_pages[_selectedPageIndex]['title']}'),
      ),
      drawer: const TadsDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        // ignore: deprecated_member_use
        selectedItemColor: Theme.of(context).hintColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
