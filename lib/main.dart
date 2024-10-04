import 'package:flutter/material.dart';
import 'package:project_4/screens/column_screen.dart';
import 'package:project_4/screens/list_screen.dart';
import 'package:project_4/screens/separated_list_screen.dart';
import 'package:project_4/recipe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Recipe> recipes = [
    Recipe(name: 'Pasta with tomato sauce', description: 'Simple and tasty'),
    Recipe(name: 'Chicken curry', description: 'Spicy and flavorful'),
    Recipe(name: 'Chocolate cake', description: 'Rich and decadent'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primaryColor: Colors.blue, // Set the primary color to blue
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Recipe App'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Column'),
                Tab(text: 'ListView'),
                Tab(text: 'ListView.separated'),
              ],
              indicatorColor: Colors.blue, // Set the tab indicator color to blue
            ),
            leading: Icon(Icons.menu, color: Colors.blue), // Set the leading icon color to blue
          ),
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[200], // Set the background color to blueGrey
                ),
              ),
              TabBarView(
                children: [
                  ColumnScreen(recipes: recipes),
                  ListScreen(recipes: recipes),
                  SeparatedListScreen(recipes: recipes),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

