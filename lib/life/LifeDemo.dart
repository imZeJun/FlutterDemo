import 'package:flutter/material.dart';

void main() => runApp((LifeDemo()));

class LifeDemo extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return LifeDemoState();
  }

}

class LifeDemoState extends State<LifeDemo> {

  var widgets = [_LifeContainer(key: ValueKey('one')), _LifeContainer(key: ValueKey('two'))];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('LifeDemo')),
        body: widgets[index.isEven ? 0 : 1],
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                index++;
              });
            }
        ),
      ),
    );
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
    return Text('_LifeContainerState=' + widget.key?.toString());
  }
}

