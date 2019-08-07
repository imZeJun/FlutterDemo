import 'package:flutter/material.dart';

void main() => runApp(_CustomNotificationWidget());

class ScrollListenerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ScrollListener")),
        body: NotificationListener(
            onNotification: (notification) {
              switch (notification.runtimeType) {
                case ScrollStartNotification : print("ScrollStartNotification"); break;
                case ScrollUpdateNotification : print("ScrollUpdateNotification"); break;
              }
            },
            child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return ListTile(title: Text("$index"));
                })),
      ),
    );
  }
}

class _CustomNotificationWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _CustomNotificationWidgetState();
  }

}

class _CustomNotificationWidgetState extends State<_CustomNotificationWidget> {

  String msg;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ScrollListener")),
        body: NotificationListener<_CustomNotification>(
            onNotification: (notification) {
              setState(() {
                msg ??= 'start';
                msg += '1';
              });
            },
            child: Row(children: <Widget>[
              Builder(
                builder: (context) {
                  return RaisedButton(
                      child: Text('++++++'),
                      onPressed: () {
                        _CustomNotification('1').dispatch(context);
                      });
                },
              ),
              Text('$msg')
            ],
        ))
      ),
    );
  }

}

class _CustomNotification extends Notification {

  String msg;

  _CustomNotification(this.msg);

}