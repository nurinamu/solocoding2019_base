import 'package:flutter/material.dart';

class Todo {
  String title;
  TodoState state;

  Todo(this.title, this.state);
}

enum TodoState {
  added, done, cancelled, archived
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