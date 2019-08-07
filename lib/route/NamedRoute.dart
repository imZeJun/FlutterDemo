import 'package:flutter/material.dart';
import 'PassArgument.dart';

void main() => runApp(NamedRouteApp());

class NamedRouteApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //Flutter App 的初始路由。
        initialRoute: '/First',
        //路由表：Map<String, WidgetBuilder>。
        routes: {
          '/First' : (context) => FirstPage(),
          '/Second' : (context) => SecondPage()
        },
        home: FirstPage()
    );
  }
}

class FirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("First Page")),
        body: RaisedButton(
          child: Text("To Second Page"),
          onPressed: () {
            Navigator.pushNamed(
                context,
                '/Second', arguments: PassArgument("Arguments from firstPage"));
          },
        )
    );
  }
}

class SecondPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Second Page")),
        body: RaisedButton(
          child: Text("Back"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
    );
  }
}



