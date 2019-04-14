import 'package:flutter/material.dart';
import 'todo.dart';
import 'todo_add.dart';

void main() => runApp(MyApp());

// This widget is the root of your application.
class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TodoWidget todolist = TodoWidget();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "nurinamu",
      home: todolist,
      routes: <String, WidgetBuilder> {
        '/add': (BuildContext context) => TodoAddPage(todolist),
      },
    );
  }

}

