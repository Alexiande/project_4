import 'package:flutter/material.dart';
import 'package:project_4/recipe.dart';

class ColumnScreen extends StatefulWidget {
  final List<Recipe> recipes;

  ColumnScreen({required this.recipes});

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
                title: Text('Add Recipe'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                    ),
                    TextField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        labelText: 'Description',
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
                    child: Text('Add'),
                  ),
                  TextButton(
                    onPressed: () {
                      _nameController.clear();
                      _descriptionController.clear();
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: widget.recipes.map((recipe) {
            return Card(
              child: ListTile(
                title: Text(recipe.name),
                subtitle: Text(recipe.description),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
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
    );
  }
}
