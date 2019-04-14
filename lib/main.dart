import 'package:flutter/material.dart';
import 'todo.dart';

void main() => runApp(MyApp());

// This widget is the root of your application.
class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Text> todos = <Text>[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "nurinamu",
      home: TodoWidget(todos)
    );
  }
}
