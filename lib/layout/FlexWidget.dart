import 'package:flutter/material.dart';

void main() => runApp(FlexWidget());

class FlexWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Layout Widget")),
        body: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Container(
                height: 50,
                width: 50,
                color: Colors.yellow,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 50,
                width: 50,
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                height: 50,
                width: 50,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

}