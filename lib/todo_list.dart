import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'todo_model.dart';
import 'todo.dart';

getTodoListView(TodoList parent, List<Todo> todos, List<Todo> archives) {
  return todos.isEmpty
      ? ListTile(title: Text("할 일이 없네.."))
      : ListView.builder(
          itemCount: todos.length,
          itemBuilder: (c, i) {
            return Slidable(
              delegate: SlidableDrawerDelegate(),
              actionExtentRatio: 0.3,
              child: todos[i].toListTile(),
              actions: <Widget>[
                new IconSlideAction(
                  caption: '보관',
                  color: Colors.blue,
                  icon: Icons.archive,
                  onTap: () {
                    parent.doAction(() {
                      todos[i].state = TodoState.archived;
                      archives.add(todos[i]);
                      todos.remove(todos[i]);
                    });
                  },
                ),new IconSlideAction(
                  caption: '공유',
                  color: Colors.deepPurple,
                  icon: Icons.share,
                  onTap: () {
                    parent.doAction(() {
                      todos[i].state = TodoState.archived;
                      archives.add(todos[i]);
                      todos.remove(todos[i]);
                    });
                  },
                ),
              ],
              secondaryActions: <Widget>[
                new IconSlideAction(
                    caption: '삭제',
                    color: Colors.indigo,
                    icon: Icons.delete,
                    onTap: () {
                      parent.doAction(() {
                        todos.remove(todos[i]);
                      });
                    }),
              ],
            );
          },
        );
}
