// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../screens/Filters_ sceern.dart';

class TadsDrawer extends StatelessWidget {
  const TadsDrawer({super.key});


  Widget buildListtitle(String title, IconData icon, Function tapHandler) {
    return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap:tapHandler as dynamic);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            // ignore: deprecated_member_use
            color: Theme.of(context).hintColor,
            child: Text(
              'Cooking Up',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListtitle('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListtitle('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersSceern.routName);
          }),
        ],
      ),
    );
  }
}
