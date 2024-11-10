import 'package:flutter/material.dart';
import 'todo_list_screen.dart';

void main(){
  runApp(MeineApp());
}

class MeineApp extends StatelessWidget{
  const MeineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:ToDoListScreen(),
    );
  }
}