import 'package:flutter/material.dart';

void main() => runApp(HeroApp());

class HeroApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Hero App')),
        body: FirstListWidget(),
      ),
    );
  }

}

class FirstListWidget extends StatelessWidget {

  static const a = 1 + 2;

  static final List<User> _users = [
    User(avatar:'assets/images/pic.png', name:'TONY'),
    User(avatar:'assets/images/pic.png', name:'TOM'),
    User(avatar:'assets/images/pic.png', name:'OK')
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
              constraints: BoxConstraints.tightFor(height: 60),
              margin: EdgeInsets.only(left: 10),
              child: Row(children: <Widget>[
                //1.使用 Hero 包裹要共享的 Widget，并保证 tag 唯一。
                Hero(
                    tag: _users[index].name,
                    child: CircleAvatar(
                      radius: 18,
                      child: Image.asset(_users[index].avatar),
                    ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(_users[index].name),
                )
              ]),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
            },
          );
        }, 
        separatorBuilder: (context, index) {
          return Container(
            constraints: BoxConstraints.tightFor(height: 0.33),
            color: Colors.black12,
          );
        },
        itemCount: _users.length);
  }
}

class SecondPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context).settings.arguments as User;
    return Scaffold(
      appBar: AppBar(title: Text('Detail Page')),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 20),
        child: Column(children: <Widget>[
          //2.在目标界面同样使用 Hero 包裹要共享的 Widget。
          Hero(
            tag: user.name,
            child: CircleAvatar(
              radius: 36,
              child: Image.asset(user.avatar),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(user.name, style: TextStyle(fontSize: 20)),
          )
        ]),
      ),
    );
  }

}

class User {
  
  String avatar;
  String name;

  User({this.avatar, this.name});
  
}