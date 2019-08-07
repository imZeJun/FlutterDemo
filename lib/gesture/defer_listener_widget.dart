import 'package:flutter/material.dart';

class DeferListenerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Row(
        children: <Widget>[
          Container(
            width: 300,
            height: 300,
            color: Colors.red,
            child: Listener(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                  )
                ],
              ), onPointerDown: (event) => print('child down' ),
              behavior: HitTestBehavior.translucent,
            ),
          )
        ],
      ),
      onPointerDown: (event) => print('parent down'),
      behavior: HitTestBehavior.opaque,
    );
  }

}