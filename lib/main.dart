import 'package:flutter/material.dart';
import 'todo.dart';

void main() => runApp(MyApp());

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "nurinamu",
      home: TodoWidget()
    );
  }
}
