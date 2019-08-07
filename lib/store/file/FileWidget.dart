import 'package:flutter/material.dart';
import 'FileUtil.dart';

void main() => runApp(FileWidget());

class FileWidget extends StatelessWidget {

  int index = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('FileWidget')),
        body: RaisedButton(onPressed: () {
          FileUtil.writePrivateFile("aaa/bbb.txt", "222").then((file) async {
            String value = await FileUtil.readPrivateFile("aaa/bbb.txt");
            print(value);
          });
        }, child: Text("query")),
      ),
    );
  }



}