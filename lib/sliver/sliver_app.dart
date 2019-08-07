import 'package:flutter/material.dart';
import 'sliver_appbar_widget.dart';
import 'sliver_persistent_header.dart';
import 'sliver_nest.dart';

void main() => runApp(SliverApp());

class SliverApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(top : true, child: SliverNestedWidget()),
      ),
    );
  }

}