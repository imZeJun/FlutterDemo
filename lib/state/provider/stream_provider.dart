import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider_bloc.dart';

void main() => runApp(_ProviderApp());

class _ProviderApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<int> (
        builder: (context) {
          return ProviderBloc().stream;
        },
        catchError: (BuildContext context, Object error) {},
        initialData: 0,
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
      onPressed: ProviderBloc().increment,
      child: const Icon(Icons.add),
    );
  }

}

class CounterLabel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<int>(
          builder: (BuildContext context, int value, Widget child) {
            return Text('you have push $value times');
          }),
    );
  }
}