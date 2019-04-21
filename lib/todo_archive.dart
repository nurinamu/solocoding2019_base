import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'todo_model.dart';
import 'todo.dart';

getArchiveListView(TodoList parent, List<Todo> archives) {
  return archives.isEmpty
      ? ListTile(title: Text("저장된 내용이 없습니다."))
      : ListView.builder(
    itemCount: archives.length,
    itemBuilder: (c, i) {
      return Slidable(
        delegate: SlidableDrawerDelegate(),
        actionExtentRatio: 0.3,
        child: archives[i].toListTile(),
        secondaryActions: <Widget>[
          new IconSlideAction(
              caption: '삭제',
              color: Colors.indigo,
              icon: Icons.delete,
              onTap: () {
                parent.doAction(() {
                  archives.remove(archives[i]);
                });
              }),
        ],
      );
    },
  );
}
