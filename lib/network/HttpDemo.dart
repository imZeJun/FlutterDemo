import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'today.dart';

void main() => runApp(HttpDemo());

class HttpDemo extends StatelessWidget {

  Dio dio;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Http Demo')),
        body: Column(
          children: <Widget>[
            RaisedButton(onPressed: () {
              _get();
            }, child: Text('_get()')),
            RaisedButton(onPressed: () {
              _post();
            }, child: Text('_post()'),),
            RaisedButton(onPressed: () {
              _modelToString();
            }, child: Text('_modelToString()'),)
          ]
        ),
      ),
    );
  }

  void _get() async {
    dio ??= Dio()..interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        print('path = ${options.path}');
        return options;
      },
      onResponse: (Response response) {
        print('onResponse = ${response.toString()}');
        return response;
      },
      onError: (DioError error) {
        return error;
      }
    ));
    try {
      Response response = await dio.get('http://gank.io/api/today');
      String jsonStr = response.toString();
      //1.先使用 {import 'dart:convert';} 将 String 转换成 Map。
      Map map = json.decode(jsonStr);
      //2.调用 Model 的函数。
      Today todayModel = Today.fromJson(map);
      print(todayModel.results['Android'][0]?.desc);
      print(jsonStr);
    } catch (e) {
      print(e);
    }
  }

  void _post() async {
    FormData formData = new FormData.from({
      "url" : "https://www.baidu.com",
      "desc" : "测试提交",
      "who" : 10001,
      "type" : "Android",
      "debug" : true
    });
    dio ??= new Dio();
    try {
      Response response = await dio.post('https://gank.io/api/add2gank', data: formData);
      print(response.data.toString());
    } catch (e) {
      print(e);
    }
  }

  void _modelToString() {
    List<ResultsItem> resultsList = [ResultsItem("_id", "desc", false, "type", "publishedAt")];
    Map<String, List<ResultsItem>> results = {"Android" : resultsList};
    Today today = Today(["Android"], false, results);
    Map map = today.toJson();
    String str = json.encode(map);
    print(str);
  }
}

