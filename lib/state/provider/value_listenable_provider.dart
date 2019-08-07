import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_notifier.dart';

void main() => runApp(_ProviderApp());

class _ProviderApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ValueListenableProvider<CounterModel>(
        builder: (context) => CounterNotifier(CounterModel(0)),
        updateShouldNotify: (model1, model2) {
          print('updateShouldNotify');
          return model1.count != model2.count;
        },
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: Text('Provider Demo')),
            body: _CounterLabel(),
            floatingActionButton: _CounterButton(),
          ),
        )
    );
  }
}

class _CounterButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        CounterModel oldModel = Provider.of<CounterModel>(context, listen: false);
        CounterModel newModel = CounterModel(oldModel.count + 1);
        newModel.notifier = oldModel.notifier;
        oldModel.notifier.value = newModel;
        return;
      },
      child: const Icon(Icons.add),
    );
  }

}

class _CounterLabel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<CounterModel>(
          builder: (BuildContext context, CounterModel model, Widget child) {
            return Text('you have push ${model.count} times');
          }),
    );
  }
}