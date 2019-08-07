import 'counter_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(_ProviderApp());

class _ProviderApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListenableProvider<Counter>(
        builder: (context) => Counter(),
        dispose: (context, counter) => counter.dispose(),
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: Text('Provider Demo')),
            //展示状态。
            body: CounterLabel(),
            //触发状态改变。
            floatingActionButton: CounterButton(),
          ),
        )
    );
  }
}

class CounterButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      //触发状态的改变。
      onPressed: Provider.of<Counter>(context, listen: false).increment,
      child: const Icon(Icons.add),
    );
  }

}

class CounterLabel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<Counter>(
          builder: (BuildContext context, Counter counter, Widget child) {
            return Text('you have push ${counter.count} times');
          }),
    );
  }
}