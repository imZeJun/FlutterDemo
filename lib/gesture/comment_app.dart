import 'package:flutter/material.dart';

void main() => runApp(CommentWidgetApp());

class CommentWidgetApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('CommentWidget')),
        body: CommentWidget(),
      ),
    );
  }
}

class CommentWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      var left = Container(
        margin: EdgeInsets.only(left: 10, top: 10),
        child: CircleAvatar(
          child: Image.asset('assets/images/pic.png'),
          radius: 20,
        ),
      );
  }

}