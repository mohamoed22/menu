// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../widgets/tabs_Drewae.dart';

class FiltersSceern extends StatefulWidget {
  final Function _savefeltaers;
  final Map<String, bool> currentFeltear;
  // ignore: constant_identifier_names
  static const routName = 'FiltersSceern';
  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  FiltersSceern(this._savefeltaers, this.currentFeltear);
  @override
  State<FiltersSceern> createState() => _FiltersSceernState();
}

class _FiltersSceernState extends State<FiltersSceern> {
  bool _isGlutenFree = false;

  bool _isLactoseFree = false;

  bool _isVegan = false;

  bool _isVegetarian = false;
  @override
  void initState() {
    _isGlutenFree = widget.currentFeltear ['gluten']!;
    _isLactoseFree = widget.currentFeltear ['lactose']!;
    _isVegan = widget.currentFeltear ['vegan']!;
    _isVegetarian = widget.currentFeltear ['vegetarian']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  final selctedfeltear = {
                    'gluten': _isGlutenFree,
                    'lactose': _isLactoseFree,
                    'vegan': _isVegan,
                    'vegetarian': _isVegetarian,
                  };

                  widget._savefeltaers(selctedfeltear);
                },
                icon: const Icon(Icons.save))
          ],
        ),
        drawer: const TadsDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                // ignore: deprecated_member_use
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            //1
            SwitchListTile(
              title: const Text('isGlutenFree'),
              subtitle: const Text('only include isGlutenFree meals'),
              value: _isGlutenFree,
              onChanged: (index) {
                setState(() {
                  _isGlutenFree = index;
                });
              },
            ),

            ///2
            SwitchListTile(
              title: const Text('isLactoseFree'),
              subtitle: const Text('only include isLactoseFree meals'),
              value: _isLactoseFree,
              onChanged: (index) {
                setState(() {
                  _isLactoseFree = index;
                });
              },
            ),
            //3
            SwitchListTile(
              title: const Text('isVegan'),
              subtitle: const Text('only include isVegan meals'),
              value: _isVegan,
              onChanged: (index) {
                setState(() {
                  _isVegan = index;
                });
              },
            ), //4
            SwitchListTile(
              title: const Text('isVegetarian'),
              subtitle: const Text('only include isVegetarian meals'),
              value: _isVegetarian,
              onChanged: (index) {
                setState(() {
                  _isVegetarian = index;
                });
              },
            ),
          ],
        ));
  }
}
