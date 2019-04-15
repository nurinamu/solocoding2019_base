import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'todo_model.dart';

class TodoWidget extends StatefulWidget {
  final TodoList todoList = TodoList();

  @override
  State<StatefulWidget> createState() => todoList;

  addTodo(String newTodo) {
    todoList.addTodo(newTodo);
  }
}

class TodoList extends State<TodoWidget> {
  List<Todo> _todos = [];

  addTodo(String title) {
    setState(() {
      _todos.add(Todo(title, TodoState.added));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("할 일 목록"),
      ),
      body: _todos.isEmpty
          ? ListTile(title: Text("할 일이 없네.."))
          : ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (c, i) {
                return Slidable(
                  delegate: SlidableDrawerDelegate(),
                  actionExtentRatio: 0.3,
                  child: _todos[i].toListTile(),
                  actions: <Widget>[
                    new IconSlideAction(
                        caption: '보관',
                        color: Colors.blue,
                        icon: Icons.archive),
                  ],
                  secondaryActions: <Widget>[
                    new IconSlideAction(
                        caption: '삭제',
                        color: Colors.indigo,
                        icon: Icons.delete),
                  ],
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, "/add")},
        child: Icon(Icons.add),
      ),
    );
  }
}
