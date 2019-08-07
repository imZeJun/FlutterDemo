import 'package:flutter/material.dart';

void main() => runApp(SnackBarBuilderWidget());

class SnackBarBuilderWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("SnackBar")),
        body: Builder(
            builder: (context) => RaisedButton(
              child: Text("Show SnackBar"),
              onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("SnackBar"),
                    duration: Duration(seconds : 5),));
              },
            )
        ),
      ),
    );
  }
}