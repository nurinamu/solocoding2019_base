import 'package:flutter/material.dart';

class TodoWidget extends StatefulWidget {
  final TodoList todoList = TodoList();
  @override
  State<StatefulWidget> createState() => todoList;

  addText(Text newTodo) {
    todoList.addText(newTodo);
  }

}

class TodoList extends State<TodoWidget> {
  List<Text> _todos = <Text>[];

  addText(Text newTodo) {
    setState(() {
      _todos.add(newTodo);
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title : Text("할 일 목록"),
      ),
      body: ListView(
        children: _todos,
      )
      ,
      floatingActionButton: FloatingActionButton(
          onPressed: () =>  {
            Navigator.pushNamed(context, "/add")
      },
        child: Icon(Icons.add),
      ),
    );
  }
}

