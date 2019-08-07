import 'package:flutter/material.dart';
import 'defer_listener_widget.dart';

void main() => runApp(ListenerApp());

class ListenerApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Listener App')),
        body: DeferListenerWidget(),
      ),
    );
  }
}