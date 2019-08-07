import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(AssetDemo());

class AssetDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Assets Demo')),
        body: AssetImageWidget(),
      ),
    );
  }

}

class AssetImageWidget extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return _AssetImageWidgetState();
  }
  
}

class _AssetImageWidgetState extends State<AssetImageWidget> {
  
  String text;
  GlobalKey imageKey = new GlobalKey();
  
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      RaisedButton(onPressed: () {
        text = 'height=${imageKey.currentContext.size.height}'
            ',width=${imageKey.currentContext.size.height}'
            ',dpi=${MediaQuery.of(context).devicePixelRatio}';
        print(text);
      }, child: Text('refresh')),
      Image(key : imageKey, image : AssetImage('assets/images/pic.png'))
    ]);
  }
}

class AssetFilesWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _AssetFilesWidgetState();
  }

}

class _AssetFilesWidgetState extends State<AssetFilesWidget> {

  String text;

  @override
  void initState() {
    super.initState();
    _loadAssetFile2();
  }

  @override
  Widget build(BuildContext context) {
    return Text(text ?? 'default');
  }

  _loadAssetFile() async {
    //需要导入 'package:flutter/services.dart'。
    String text = await rootBundle.loadString('assets/files/hello.txt');
    print(text);
    setState(() {
      this.text = text;
    });
  }

  _loadAssetFile2() async {
    String text = await DefaultAssetBundle.of(context).loadString('assets/files/hello.txt');
    setState(() {
      this.text = text;
    });
  }

}