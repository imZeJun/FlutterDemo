import 'package:flutter/material.dart';

void main() => runApp(GridViewDefaultWidget());

class GridViewDefaultWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("GridViewDefaultWidget")),
          body: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              children: <Widget>[
                 ListTile(title: Text("text1")),
                 ListTile(title: Text("text2")),
                 ListTile(title: Text("text3")),
                 ListTile(title: Text("text4")),
              ],
          ),
        ),
      );
  }

}

class GridViewCountWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("GridViewCountWidget")),
        body: GridView.count(
            crossAxisCount: 3,
            children: <Widget>[
              ListTile(title: Text("text1")),
              ListTile(title: Text("text2")),
              ListTile(title: Text("text3")),
              ListTile(title: Text("text4")),
          ],
        ),
      ),
    );
  }
}