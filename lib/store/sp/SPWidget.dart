import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(SPWidget());

class SPWidget extends StatelessWidget {

  String value;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("SPWidget")),
        body: Column(children: <Widget>[
          TextField(
            onChanged: (value) {
              this.value = value;
            },
          ),
          RaisedButton(
            child: Text("save"),
            onPressed: () {
              saveValue(value);
            },
          ),
          SPReadWidget()
        ],
        ),
      ),
    );
  }

  void saveValue(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("value", value);
  }

}

class SPReadWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SPReadWidgetState();
  }
}

class SPReadWidgetState extends State<SPReadWidget> {

  String value = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text("readValue=" + value),
      onTap: () {
        readValue();
      },
    );
  }

  void readValue() async {
    final prefs = await SharedPreferences.getInstance();
    String value = prefs.getString("value");
    setState(() {
      this.value = value;
    });
  }
}