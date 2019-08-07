import 'package:flutter/material.dart';

void main() => runApp(ListViewBuilderWidget(
  items: List<String>.generate(1000, (i) => "item $i"),
));

class ListViewBuilderWidget extends StatelessWidget {

  final List<String> items;

  ListViewBuilderWidget({Key key, @required this.items}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title : Text("ListView")),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text("{items[index]}"));
            }),
      ),
    );
  }
}

class ListViewSeparatedWidget extends StatelessWidget {

  final List<String> items;

  ListViewSeparatedWidget({Key key, @required this.items}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title : Text("ListView")),
        body: ListView.separated(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text("{items[index]}"));
            },
            separatorBuilder: (context, index) {
              return Container(
                constraints: BoxConstraints.tightFor(height: 10),
                color: Colors.orange,
              );
            },
        ),
      ),
    );
  }
}

class ListViewCustomWidget extends StatelessWidget {

  final List<String> items;

  ListViewCustomWidget({Key key, @required this.items}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title : Text("ListView")),
        body: ListView.custom(
            childrenDelegate: SliverChildListDelegate(<Widget>[
              ListTile(title: Text('Title1')),
              ListTile(title: Text('Title2')),
              ListTile(title: Text('Title3')),
              ListTile(title: Text('Title4')),
              ListTile(title: Text('Title5')),
              ListTile(title: Text('Title6')),
            ])),
      ),
    );
  }
}