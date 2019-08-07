import 'package:flutter/material.dart';
import 'PassArgument.dart';

void main() => runApp(SimpleRouteApp());

class SimpleRouteApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage()
    );
  }
}

class FirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("First Page")),
        body: RaisedButton(
          child: Text("To Second Page"),
          onPressed: () {
            animateToSecondPage(context);
        },
      )
    );
  }
  
  void goToSecondPage(BuildContext context) async {
    var result = await Navigator.push<PassArgument>(
      context,
      MaterialPageRoute(
          builder: (context) => SecondPage(),
          maintainState: false,
          settings: RouteSettings(
              arguments: PassArgument("Arguments From FirstPage")
          )
      ),
    );
    print(result.title);
  }

  void animateToSecondPage(BuildContext context) async {
    Navigator.push(
      context,
      PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return SecondPage();
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation, Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
                position: Tween(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child
            );
          }
      ),
    );
  }
}

class SecondPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var title = (ModalRoute.of(context).settings.arguments as PassArgument).title;
    return Scaffold(
        appBar: AppBar(title: Text("Second Page")),
        body: RaisedButton(
          child: Text("$title, Back"),
          onPressed: () {
            Navigator.pop(context, PassArgument("Arguments From Second Page"));
          },
        )
    );
  }
}



