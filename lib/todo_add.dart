import 'package:flutter/material.dart';
import 'todo.dart';

class TodoAddPage extends StatefulWidget {
  final TodoWidget todoWidget;
  TodoAddPage(this.todoWidget);

  @override
  State<StatefulWidget> createState() => TodoAdd(todoWidget);

}

class TodoAdd extends State<TodoAddPage> {
  final TodoWidget todoWidget;
  final TextEditingController todoInputController = TextEditingController();

  TodoAdd(this.todoWidget);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("할 일 추가"),
      ),
      body: TextField(
        controller: todoInputController,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {
            addAction(context)
          },
          child: Icon(Icons.check),

      ),
    );
  }

  addAction(BuildContext context) {
    todoWidget.addTodo(todoInputController.text);
    todoInputController.clear();
    Navigator.pop(context);
  }

}
