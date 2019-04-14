import 'package:flutter/material.dart';

class TodoWidget extends StatefulWidget {
  final List<Text> _todos;
  TodoWidget(this._todos);

  @override
  State<StatefulWidget> createState() => TodoList(_todos);
}

class TodoList extends State<TodoWidget> {
  final List<Text> _todos;
  TodoList(this._todos);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("할 일 목록"),
      ),
      body: todoList(),
      floatingActionButton: FloatingActionButton(
          onPressed: () =>  {
            Navigator.push(context, MaterialPageRoute(builder: null))
      },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget todoList() {
    return
      _todos.isEmpty ?
      Text("할일이 없다.") :
      ListView.builder(itemBuilder: (BuildContext _context, int i){
        return _todos[i];
      });
  }

}

