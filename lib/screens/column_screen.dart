import 'package:flutter/material.dart';
import 'package:project_4/recipe.dart';

class ColumnScreen extends StatefulWidget {
  final List<Recipe> recipes;

  ColumnScreen({required this.recipes, required Color backgroundColor});

  @override
  _ColumnScreenState createState() => _ColumnScreenState();
}

class _ColumnScreenState extends State<ColumnScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Add Recipe', style: TextStyle(color: Colors.blue)), // Add blue color to the title
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(), // Add a border to the text field
                      ),
                    ),
                    TextField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(), // Add a border to the text field
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        widget.recipes.add(
                          Recipe(
                            name: _nameController.text,
                            description: _descriptionController.text,
                          ),
                        );
                        _nameController.clear();
                        _descriptionController.clear();
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text('Add', style: TextStyle(color: Colors.blue)), // Add blue color to the 'Add' button
                  ),
                  TextButton(
                    onPressed: () {
                      _nameController.clear();
                      _descriptionController.clear();
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel', style: TextStyle(color: Colors.grey)), // Add grey color to the 'Cancel' button
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add, color: Colors.blue), // Add blue color to the floating action button
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[200], // Set the background color to blueGrey
        ),
        child: SingleChildScrollView(
          child: Column(
            children: widget.recipes.map((recipe) {
              return Card(
                color: Colors.white, // Set the card background color to white
                child: ListTile(
                  title: Text(recipe.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), // Add bold font to the recipe name
                  subtitle: Text(recipe.description, style: TextStyle(fontSize: 16, color: Colors.grey)), // Add grey color to the recipe description
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.blue), // Add red color to the delete icon
                    onPressed: () {
                      setState(() {
                        widget.recipes.remove(recipe);
                      });
                    },
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
