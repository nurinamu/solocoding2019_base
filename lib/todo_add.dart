import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

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

  Color pickedColor = Color(0xFFFFFF);

  TodoAdd(this.todoWidget);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("할 일 추가"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            rowWithTitle("할 일: ",
              Expanded(child: TextField(
                autofocus: true,
                controller: todoInputController,
              ))
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: RaisedButton(
                        color: pickedColor,
                        onPressed: () {
                          openPicker();
                        },
                        child: Text("표시 색상")),
                  ),
                )
              ],
            )
          ],
        ),
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
    todoWidget.addTodo(todoInputController.text, pickedColor);
    todoInputController.clear();
    Navigator.pop(context);
  }

  Row rowWithTitle(String title, Widget child) {
    return Row(
      children: <Widget>[
        Text(title),
        child
      ],
    );
  }

  void openPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            child: MaterialColorPicker(
              selectedColor: pickedColor,
              onColorChange: (Color color){
                pickedColor = color;
              },
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('Got it'),
              onPressed: () {
                setState(() => pickedColor = pickedColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


}
