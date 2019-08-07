import 'package:flutter/material.dart';

void main() => runApp(BottomSheetWidget());

class BottomSheetWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("BottomSheet")),
        body: Column(children: <Widget>[
          Builder(
            builder: (context) => RaisedButton(
              child: Text("PersistentBottomSheet"),
              onPressed: () {
                showBottomSheet(
                    context: context, 
                    builder: (context) => BottomSheet(
                      onClosing: (){},
                      builder: (context) => Container(
                        height: 200,
                        color: Colors.blue,
                        child: Center(
                          child: RaisedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("dismiss BottomSheet"),
                          ),
                        ),
                      ),
                    ));
              },
            ),
          ),
          Builder(
            builder: (context) => RaisedButton(
              child: Text("ModalBottomSheet"),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => BottomSheet(
                      onClosing: () {},
                      builder: (context) => Container(
                        height: 200,
                        color: Colors.blue,
                        child: Center(
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("dismiss BottomSheet"),
                          ),
                        )
                      ),
                    ));
              },
            )
          )
        ],
        ),
      ),
    );
  }
}