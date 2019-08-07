import 'package:flutter/material.dart';
import 'TodoProvider.dart';

void main() => runApp(SqliteWidget());

class SqliteWidget extends StatelessWidget {

  int index = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: RaisedButton(onPressed: () {
          TodoProvider.instance.insertTodo(Todo(title: "first=${index++}", done: true));
          _query();
        }, child: Text("query")),
      ),
    );
  }

  _query() async {
    Todo todo = await TodoProvider.instance.queryTodo(1);
    print(todo.title);
  }

}