import 'package:flutter/material.dart';
import 'todo_list.dart';
import 'todo_archive.dart';
import 'todo_model.dart';

class TodoWidget extends StatefulWidget {
  final TodoList todoList = TodoList();

  @override
  State<StatefulWidget> createState() => todoList;

  addTodo(String newTodo, Color pickedColor) {
    todoList.addTodo(newTodo, pickedColor);
  }
}

enum ListKind {
  todo, archive
}

class TodoList extends State<TodoWidget> {
  List<Todo> _todos = [];
  List<Todo> _archives = [];
  ListKind current = ListKind.todo;

  addTodo(String title, Color pickedColor) {
    setState(() {
      _todos.add(Todo(title, TodoState.added, pickedColor));
    });
  }

  doAction(Function func) {
    setState(func);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListKind.todo == current ? Text("할 일 목록") : Text("보관함"),
      ),
      body: ListKind.todo == current ? getTodoListView(this, _todos, _archives) : getArchiveListView(this, _archives),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, "/add")},
        child: Icon(Icons.add),
      ),
        drawer: Drawer(
            child:
            ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.developer_board),
                  title: Text('할 일 목록'),
                  onTap: () {
                    setState(() {
                      current = ListKind.todo;
                      Navigator.pop(context);
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.archive),
                  title: Text('보관함'),
                  onTap: () {
                    setState(() {
                      current = ListKind.archive;
                      Navigator.pop(context);
                    });
                  },
                )
              ],
            )
        )
    );
  }
}
