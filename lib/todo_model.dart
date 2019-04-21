import 'package:flutter/material.dart';
import 'package:share/share.dart';

class Todo {
  String title;
  DateTime targetDate;
  TodoState state;

  Todo(this.title, this.state);

  ListTile toListTile() {
    return ListTile(
      leading: Icon(findIconByState(state)),
      title: Text(title),
      subtitle: Text(timeStr(targetDate)), //FIXME
      trailing: IconButton(
          icon: Icon(Icons.share),
          onPressed: () {
            Share.share("Todo : " + title + " [" + timeStr(targetDate) + "]");
          }),
    );
  }

  IconData findIconByState(TodoState state) {
    switch (state) {
      case TodoState.added:
        return Icons.check_box_outline_blank;
      case TodoState.done:
        return Icons.check_box;
      case TodoState.cancelled:
        return Icons.clear;
      case TodoState.archived:
        return Icons.archive;
    }
  }

  String timeStr(DateTime date) =>
      date == null ? DateTime.now().toIso8601String() : date.toIso8601String();
}

enum TodoState { added, done, cancelled, archived }
