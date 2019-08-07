import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MethodChannelWidget());

class MethodChannelWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MethodChannelWidgetState();
  }

}

class _MethodChannelWidgetState extends State<MethodChannelWidget> {

  var methodChannel = const MethodChannel('samples.flutter.io/messages');

  String value = "";

  @override
  void initState() {
    super.initState();
    methodChannelFromAndroid();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("MethodChannel")),
        body: Column(children: <Widget>[
          RaisedButton(
            child: Text("向 Android 发送消息"),
            onPressed: () {
              methodChannelToAndroid();
            },
          ),
          RaisedButton(
            child: Text("从 Android 接收的消息 = " + value),
            onPressed: () {},
          )
        ],
        ),
      ),
    );
  }

  void methodChannelToAndroid() async {
    var arguments = Map();
    arguments['content'] = "message from flutter";
    try {
      String result = await methodChannel.invokeMethod("toast", arguments);
      print("result=" + result);
    } on PlatformException catch (e) {
      print("result=" + e.message);
    } on MissingPluginException catch (e) {
      print("result=" + e.message);
    }
  }

  void methodChannelFromAndroid() {
    methodChannel.setMethodCallHandler((methodChannel) async {
      print("methodChannelFromAndroid");
      switch (methodChannel.method) {
        case "increase":
          String content = await methodChannel.arguments['content'];
          if (content != null && content.isNotEmpty) {
            setState(() {
              this.value = content;
            });
            return "success";
          } else {
            throw throw PlatformException(
                code: '-1',
                message: 'increase fail',
                details: 'content is null');
          }
          break;
        default:
          throw MissingPluginException();
      }
    });
  }

}