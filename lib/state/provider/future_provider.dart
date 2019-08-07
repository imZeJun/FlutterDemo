import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(_ProviderApp());

class _ProviderApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureProvider<int>(
        builder: (context) => _request(),
        initialData: 0,
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: Text('Provider Demo')),
            body: CounterLabel(),
          ),
        )
    );
  }

  Future<int> _request() async {
    return await Future<int>.delayed(Duration(milliseconds: 3000)).then((int value) {
        return 300;
    });
  }
}

class CounterLabel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Consumer<int>(
            builder: (BuildContext context, int count, Widget child) {
              return Text('Observer1=$count');
            }),
        Consumer<int>(
            builder: (BuildContext context, int count, Widget child) {
              return Text('Observer2=$count');
            }),
      ],)
    );
  }
}