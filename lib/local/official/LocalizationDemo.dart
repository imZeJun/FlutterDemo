import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_app/generated/i18n.dart';

void main() => runApp(LocalDemo());

class LocalDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        //1.这个要放到第一个。
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: Scaffold(
        appBar: AppBar(title: Text('Local Demo')),
        body: Builder(
            builder: (context) {
              //2.使用方式。
              return Text(S.of(context).helloWorld);
            }
        )
      ),
    );
  }
}