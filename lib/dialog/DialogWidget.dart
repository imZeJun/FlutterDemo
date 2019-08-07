import 'package:flutter/material.dart';

void main() => runApp(DialogWidget());

class DialogWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Dialog Demo")),
        body: Column(
          children: <Widget>[
            Builder(
              builder: (context) => RaisedButton(
                child: Text("about dialog"),
                onPressed: () {
                  showAboutDialog(
                    context: context,
                    applicationName: "about dialog",
                    applicationVersion: "1.0"
                  );
                },
              )),
            Builder(
              builder: (context) => RaisedButton(
                child: Text("simple dialog"),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                        title: Text("Simple Dialog"),
                        children: <Widget>[
                          SimpleDialogOption(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          SimpleDialogOption(
                            child: Text("Cancel"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      )
                  );
                },
              ),
            ),
            Builder(
              builder: (context) => RaisedButton(
                child: Text("alert dialog"),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Alert Dialog"),
                        content: Column(
                          children: <Widget>[
                            Text("This is an alert dialog"),
                            Text("add two options")
                          ],
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text("cancel"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      )
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}