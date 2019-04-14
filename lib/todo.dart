import 'package:flutter/material.dart';

class TodoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TodoList();
}

class TodoList extends State<TodoWidget> {
  final List<Text> todos = <Text>[];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("할 일 목록"),
      ),
      body: todoList(),
      floatingActionButton: FloatingActionButton(
          onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget todoList() {
    return
      todos.isEmpty ?
      Text("할일이 없다.") :
      ListView.builder(itemBuilder: (BuildContext _context, int i){
        return todos[i];
      });
  }

}

