import 'package:flutter/material.dart';

void main() => runApp(TextWidget());

class TextWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TextWidget Demo",
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("TextWidget Demo"),),
        body: Column(
          children: <Widget>[
            Text(
              "TextWidget",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 25,
                  background: new Paint()..color = Colors.green
              ),),
            RichText(
                text: TextSpan(children: [
                  TextSpan(text: "Hello", style: TextStyle(color : Colors.red)),
                  TextSpan(text: "World", style: TextStyle(color: Colors.blue))
                ],)
            ),
            Text(
              "Benmo Text",
              style: TextStyle(
                fontFamily: "benmo"
              ),
            )
          ]
        )
      )
    );
  }

}