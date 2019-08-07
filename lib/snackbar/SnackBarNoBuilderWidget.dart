import 'package:flutter/material.dart';

void main() => runApp(SnackBarNoBuilderWidget());

class SnackBarNoBuilderWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("SnackBar")),
        body: _SnackBar()
      ),
    );
  }
}

class _SnackBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text("Show SnackBar"),
        onPressed: () {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("SnackBar"),
            duration: Duration(seconds : 5),));
        });
  }
}