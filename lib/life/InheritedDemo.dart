import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

void main() => runApp(InheritedDemo());

class InheritedDemo extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _InheritedDemoState();
  }

}

class _InheritedDemoState extends State<InheritedDemo> {

  Color _color = RandomColor().randomColor();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('_InheritedDemoState')),
        body: InheritedColorWidget(
          color: _color,
          child: Column(children: <Widget>[
            _LifeContainer(key: ValueKey('isInherited')),
            _LifeContainer(key: ValueKey('noInherited')),
          ],),),
        floatingActionButton: FloatingActionButton(onPressed: () {
          setState(() {
            _color = RandomColor().randomColor();
          });
        }),
      ),
    );
  }
}

class InheritedColorWidget extends InheritedWidget {

  final Color color;

  InheritedColorWidget({@required this.color, Widget child}) : super(child : child);

  static InheritedColorWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(InheritedColorWidget);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return (oldWidget as InheritedColorWidget).color != color;
  }

}

class _LifeContainer extends StatefulWidget {

  _LifeContainer({Key key}) : super(key : key);

  @override
  State<StatefulWidget> createState() {
    return _LifeContainerState();
  }
}

class _LifeContainerState extends State<_LifeContainer> {

  @override
  void initState() {
    print('initState=' + widget.key?.toString());
    super.initState();
  }

  @override
  void didUpdateWidget(_LifeContainer oldWidget) {
    print('didUpdateWidget, oldWidget=' + oldWidget.key?.toString() + ",new=" + widget.key?.toString());
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies=' + widget.key?.toString());
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    print('deactivate=' + widget.key?.toString());
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose=' + widget.key?.toString());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build=' + widget.key?.toString());
    bool isInherited = (widget.key as ValueKey).value == 'isInherited';
    return Text(widget.key.toString(),
        style: TextStyle(color: (isInherited ? InheritedColorWidget.of(context).color : RandomColor().randomColor())));
  }
}

