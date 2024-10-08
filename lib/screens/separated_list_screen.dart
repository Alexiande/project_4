import 'package:flutter/material.dart';
import 'package:project_4/recipe.dart';

class AppImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/img.png');
  }
}

class SeparatedListScreen extends StatefulWidget {
  final List<Recipe> recipes;

  SeparatedListScreen({required this.recipes, required MaterialColor backgroundColor});

  @override
  _SeparatedListScreenState createState() => _SeparatedListScreenState();
}

class _SeparatedListScreenState extends State<SeparatedListScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Separated List Screen'),
        leading: AppImage(), // добавляем картинку в appBar
      ),
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
      body: ListView.separated(
        itemCount: widget.recipes.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(widget.recipes[index].name),
            subtitle: Text(widget.recipes[index].description),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  widget.recipes.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}

class AnotherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another Screen'),
        leading: AppImage(), // добавляем картинку в appBar
      ),
      body: Center(
        child: AppImage(), // добавляем картинку в body экрана
      ),
    );
  }
}

