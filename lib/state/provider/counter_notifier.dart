import 'package:flutter/foundation.dart';

class CounterModel {

  int count;
  CounterNotifier notifier;

  CounterModel(this.count);

}

class CounterNotifier extends ValueNotifier<CounterModel> {

  CounterNotifier(CounterModel value) : super(value) {
    value.notifier = this;
  }

  @override
  void dispose() {
    super.dispose();
    //在这里释放资源。
  }

}