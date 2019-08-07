import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() => runApp(AppWidget());

class AppWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("RecognizerWidget")),
        body: _GestureConflictTestRoute(),
      ),
    );
  }
}

class _GestureRecognizerTestRoute extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _GestureRecognizerTestRouteState();
  }
}

class _GestureRecognizerTestRouteState extends State<_GestureRecognizerTestRoute> {

  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: '你好世界'),
              TextSpan(
                text: '点我变色',
                style: TextStyle(
                  fontSize: 30,
                  color: _toggle ? Colors.blue : Colors.red
                ),
                recognizer: _tapGestureRecognizer..onTap = () {
                  setState(() {
                    _toggle = !_toggle;
                  });
                }
              ),
              TextSpan(text: '你好世界')
            ]
          )
      ),
    );
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

}


class _GestureConflictTestRoute extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _GestureConflictTestRouteState();
  }

}

class _GestureConflictTestRouteState extends State<_GestureConflictTestRoute> {

  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: _left,
          child: Listener(
            onPointerDown: (details) {
              print('onPointerDown');
            },
            onPointerUp: (details) {
              print('onPointerUp');
            },
            child: GestureDetector(
              child: CircleAvatar(child: Text("A")),
              onHorizontalDragUpdate: (details) {
                setState(() {
                  _left += details.delta.dx;
                });
              },
              onHorizontalDragEnd: (details) {
                print('onHorizontalDragEnd');
              },
            ),
          )
        )
      ],
    );
  }

}