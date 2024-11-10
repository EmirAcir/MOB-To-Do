import 'package:flutter/material.dart';
import 'todo_item.dart'; 

class TodoDetailScreen extends StatelessWidget {
  final TodoItem todoItem;

  const TodoDetailScreen({super.key, required this.todoItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todoItem.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              todoItem.description,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Hier kann später die Logik zum Abschließen des Eintrags eingefügt werden
                Navigator.pop(context); // Gehe zurück zur vorherigen Ansicht
              },
              child: const Text('Abschließen'),
            ),
          ],
        ),
      ),
    );
  }
}
