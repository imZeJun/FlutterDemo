import 'package:flutter/material.dart';

void main() => runApp(TextFieldApp());

class TextFieldApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("TextField Demo")),
        body: Column(children: <Widget>[
          TextField(
            onChanged: (String data) {
              print(data);
            },
          )
        ],
        ),
      ),
    );
  }
}