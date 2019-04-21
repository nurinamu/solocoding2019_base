import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:intl/intl.dart';

class Todo {
  String title;
  DateTime targetDate;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd H:m");
  TodoState state;
  Color backgroundColor;

  Todo(this.title, this.state, this.backgroundColor) {
    targetDate = DateTime.now();
  }

  Widget toListTile() {
    return Container(
      color: backgroundColor,
      child: ListTile(
        leading: Icon(findIconByState(state)),
        title: Text(title),
        subtitle: Text(timeStr()), //FIXME
        trailing: IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share("Todo : " + title + " [" + timeStr() + "]");
            }),
      ),
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

  String timeStr() =>
      dateFormat.format(targetDate == null ? DateTime.now() : targetDate);

}

enum TodoState { added, done, cancelled, archived }
