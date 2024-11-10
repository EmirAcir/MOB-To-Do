import 'package:flutter/material.dart';
import 'todo_item.dart';
import 'todo_detail_screen.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  List<TodoItem> todoItems = [];

  void _addTodoItem(String name, String description) {
    setState(() {
      todoItems.add(TodoItem(name: name, description: description));
    });
  }

  void _showAddTodoDialog() {
    String name = '';
    String description = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Neues To-do hinzufügen'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Beschreibung'),
                onChanged: (value) {
                  description = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (name.isNotEmpty && description.isNotEmpty) {
                  _addTodoItem(name, description);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Hinzufügen'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Abbrechen'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToDetailScreen(TodoItem todoItem) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TodoDetailScreen(todoItem: todoItem),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To-do Liste')),
      body: ListView.builder(
        itemCount: todoItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todoItems[index].name),
            onTap: () {
              _navigateToDetailScreen(todoItems[index]); // Navigiere zur Detailansicht
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
