import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_app/state/scoped/CountScopedModel.dart';

void main() => runApp(ScopedModelApp());

class ScopedModelApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    CountScopedModel model = CountScopedModel();
    return ScopedModel<CountScopedModel>(
      model: model,
      child: FirstScreen()
    );
  }
  
}

class FirstScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("First Screen")),
        body: Center(
          child: ScopedModelDescendant<CountScopedModel>(
              builder: (BuildContext context, Widget child, CountScopedModel model) {
                  return Text('${model.count}', style: TextStyle(fontSize: 20));
              }),
        ),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SecondScreen()));
            },
            child: Icon(Icons.forward),
          );
        }),
      ),
    );
  }

}

class SecondScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final countModel = ScopedModel.of<CountScopedModel>(context, rebuildOnChange: true);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Second Screen")),
        body: Center(
          child: Text('${countModel.count}', style: TextStyle(fontSize: 20)),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              countModel.increment();
            },
            child: Icon(Icons.add),
        ),
      ),
    );
  }
  
}