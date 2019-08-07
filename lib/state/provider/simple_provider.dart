import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider_bloc.dart';

void main() => runApp(_ProviderApp());

class _ProviderApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provider<ProviderBloc>(
      builder: (context) => ProviderBloc(),
      dispose: (context, bloc) => bloc.dispose(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Provider Demo')),
          //展示状态。
          body: CounterLabel(),
          //触发状态改变。
          floatingActionButton: CounterButton(),
        ),
      ),
    );
  }
}

class CounterButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      //触发状态的改变。
      onPressed: Provider.of<ProviderBloc>(context, listen: false).increment,
      child: const Icon(Icons.add),
    );
  }

}

class CounterLabel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<int>(
        builder: (context, snapshot) {
          return Text('you have push ${snapshot.data} times');
        },
        initialData: 0,
        stream: Provider.of<ProviderBloc>(context).stream,
      ),
    );
  }
}
