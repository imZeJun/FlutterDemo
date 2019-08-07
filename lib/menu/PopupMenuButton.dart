import 'package:flutter/material.dart';

void main() => runApp(PopMenuButtonWidget());

class PopMenuButtonWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("PopMenuButtonWidget")),
        body: PopupMenuButton<String>(
            child: Text("更多"),
            onSelected: (String result) {
              print("click=" + result);
            },
            itemBuilder: (context) => <PopupMenuEntry<String>> [
              const PopupMenuItem<String>(
                  value: "Menua",
                  child: Text("menuA")),
              const PopupMenuItem<String>(
                  value: "Menub",
                  child: Text("menuB"))
            ],
        ),
      ),
    );
  }
}