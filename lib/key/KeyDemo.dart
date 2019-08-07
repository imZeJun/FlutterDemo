import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

void main() => runApp(KeyScreenDemo());

class KeyScreenDemo extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _KeyScreenDemoState();
  }

}

class _KeyScreenDemoState extends State<KeyScreenDemo> {

  List<Widget> _widgets = [
    Padding(
      padding: EdgeInsets.all(10),
      child: _StatefulContainer(key : GlobalKey(debugLabel: 'label1')),
    ),
    Padding(
      padding: EdgeInsets.all(10),
      child: _StatefulContainer(key : GlobalKey(debugLabel: 'label2')),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('KeyDemo')),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _widgets,
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              _switch();
            }, child: Icon(Icons.add)),
      ),
    );
  }

  void _switch() {
    _widgets.insert(0, _widgets.removeAt(1));
    setState(() {});
  }

}

class _StatelessContainer extends StatelessWidget {

  final Color color = RandomColor().randomColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}

class _StatefulContainer extends StatefulWidget {

  _StatefulContainer({Key key}) : super(key : key);

  @override
  State<StatefulWidget> createState() {
    return _StatefulContainerState();
  }

}

class _StatefulContainerState extends State<_StatefulContainer> {

  final Color color = RandomColor().randomColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}
