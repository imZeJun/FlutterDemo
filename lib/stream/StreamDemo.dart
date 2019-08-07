import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(StreamDemo());

class StreamDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Stream Demo')),
        body: _StreamHome(),
      ),
    );
  }
}

class _StreamHome extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _StreamHomeState();
  }
}

class _StreamHomeState extends State<_StreamHome> {

  String _message = '';
  StreamController<String> _controller;
  StreamController<int> _intController;

  @override
  void initState() {
    super.initState();
    _controller = StreamController<String>();
    _controller.stream.take(4).listen(
            (String data) {
              setState(() {
                _message += data;
              });
            },
        onDone: () => print('onDone'),
        onError: (e) => print('onError=' + (e as AssertionError).message), cancelOnError: true);
    var transformer = StreamTransformer<int, String>.fromHandlers(
        handleData: (int source, sink) {
          if (source < 5) {
            sink.add(source.toString() + ",");
          }
        }
    );
    _intController = StreamController<int>();
    _intController.stream.transform(transformer).listen(
        (String data) {
          setState(() {
            _message += data;
          });
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('you have send $_message'),
      RaisedButton(
        child: Text('Add Count'),
        onPressed: () {
          //_intController.sink.add(Random().nextInt(10));
          _controller.sink.add('a');
        },
      )
    ],);
  }

}