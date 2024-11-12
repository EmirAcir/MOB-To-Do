import 'package:flutter/material.dart';
import 'login_screen.dart'; // Importiere den LoginScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(), // Starte die App mit dem LoginScreen
    );
  }
}
