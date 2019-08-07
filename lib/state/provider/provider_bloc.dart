import 'dart:async';

class ProviderBloc {

  //单例对象。
  static ProviderBloc _instance;

  //构造函数。
  ProviderBloc._internal() {
    print("_internal");
  }

  static ProviderBloc _getInstance() {
    //仅在 _instance 为空时才调用。
    if (_instance == null) {
      _instance = ProviderBloc._internal();
    }
    return _instance;
  }

  //1.通过 new CountBloc() 调用。
  factory ProviderBloc() => _getInstance();
  //2.通过 CountBloc.instance 调用。
  static ProviderBloc get instance => _getInstance();

  int _count = 0;
  var _countController = StreamController<int>.broadcast();

  Stream<int> get stream => _countController.stream;
  int get count => _count;

  increment() {
    _countController.sink.add(++_count);
  }

  dispose() {
    _countController.close();
  }

}