import 'package:flutter/material.dart';
import 'CountState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() => runApp(ReduxApp());

class ReduxApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final store =
        Store<CountState>(reducer, initialState: CountState.initState());
    return StoreProvider(
        store: store,
        child: MaterialApp(home: FirstScreen())
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
            child: StoreConnector<CountState, int>(
                builder: (BuildContext context, int count) {
                  return Text(count.toString(),
                      style: TextStyle(fontSize: 20));
                  },
                converter: (Store store) {
                  return store.state.count;
                })
        ),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondScreen()));
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
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("Second Screen")),
          body: Center(
              child: StoreConnector<CountState, int>(
                  builder: (BuildContext context, int count) {
                    return Text(count.toString(), style: TextStyle(fontSize: 20));
                  },
                  converter: (Store store) {
                    return store.state.count;
                  })),
          floatingActionButton: StoreConnector<CountState, VoidCallback>(
              builder: (context, callback) {
                return FloatingActionButton(
                  onPressed: callback,
                  child: Icon(Icons.add),
                );},
              converter: (Store store) {
                return () => store.dispatch(Action.increment);
              })
      ),
    );
  }
}
