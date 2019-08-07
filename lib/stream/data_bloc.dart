import 'dart:async';

class DataBloc {
  //1.定义 Controller。
  StreamController<List<String>> _dataController = StreamController<List<String>>.broadcast();
  //2.获取 StreamSink 作为 add 的入口。
  StreamSink<List<String>> get _dataSink => _dataController.sink;
  //3.获取 Stream 用于监听。
  Stream<List<String>> get _dataStream => _dataController.stream;
  //4.事件订阅对象。
  StreamSubscription<List<String>> _dataSubscription;

  init() {
    //a.监听事件。
    _dataSubscription = _dataStream.listen((event) {

    });
    //b.发送事件。
    _dataSink.add(['aa', 'bb', 'cc']);
  }

  close () {
    //关闭。
    _dataSubscription.cancel();
    _dataController.close();
  }

}