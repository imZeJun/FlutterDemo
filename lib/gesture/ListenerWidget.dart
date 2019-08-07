import 'package:flutter/material.dart';

void main() => runApp(ListenerWidget());

class ListenerWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ListenerWidgetState();
  }

}


class _ListenerWidgetState extends State<ListenerWidget> {

  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Listener Widget")),
        body: Column(children: <Widget>[
          Listener(
            child: Container(
              height: 150,
              width: 300,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(_event?.toString() ?? "", style: TextStyle(color: Colors.white)),
            ),
            onPointerDown: (event) {
              setState(() {
                _event = event;
              });
            },
            onPointerMove: (event) {
              setState(() {
                _event = event;
              });
            },
            onPointerUp: (event) {
              setState(() {
                _event = event;
              });
            },
          ),
          Listener(
            child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300, 150)),
                child: Center(child: Text("Box A")),
            ),
            //behavior: HitTestBehavior.opaque,
            onPointerDown: (event) => print("downA"),
          ),
          Stack(
            children: <Widget>[
              Listener(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                  child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.blue)),
                ),
                onPointerDown: (event) => print("down0"),
              ),
              Listener(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                  child: Center(
                      child: Text("左上角 200 * 100 范围内非文本区域点击")),
                ),
                onPointerDown: (event) => print("down1"),
                behavior: HitTestBehavior.opaque,
              )
            ],
          )
        ],
        )
      ),
    );
  }
}