import 'package:flutter/material.dart';

void main() => runApp(ContainerWidget());

class ContainerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Container Widget")),
        body: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Text("Padding", style: TextStyle(background: new Paint()..color = Colors.red)),
          )
        ],),
      ),
    );
  }
}