import 'package:flutter/material.dart';

void main() => runApp(BoxConstraintsWidget());

class BoxConstraintsWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("BoxConstraints")),
        body: Column(children: <Widget>[
          Container(
            constraints: BoxConstraints.loose(Size(1, 1)),
            color: Colors.red,
            child: Text(
            "Hello World!!!",
            style: TextStyle(background: new Paint().. color = Colors.blue),
            )),
          ListView(

          )
        ])
        )
      );
  }
}