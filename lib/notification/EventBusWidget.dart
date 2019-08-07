import 'package:flutter/material.dart';
import 'EventBus.dart';

void main() => runApp(EventBusWidget());

class EventBusWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    bus.add("login", (userName) {
      print('userName=$userName');
    });
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("EventWidget")),
        body: GestureDetector(
          child: Text("login"),
          onTap: () {
            bus.notice("login", "tony");
          },
        )
      ),
    );
  }

}