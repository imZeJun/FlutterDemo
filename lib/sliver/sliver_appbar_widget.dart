import 'package:flutter/material.dart';

class SliverAppBarWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          //返回箭头。
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                print('back');}),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  print('add');
                },),
            IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {
                  print('more');
                })
          ],
          //展开时的高度。
          expandedHeight: 200,
          //显示阴影。
          forceElevated: true,
          //该属性设置 appBar 的背景。
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset("images/weather.jpg", fit: BoxFit.fill),
            collapseMode: CollapseMode.parallax,
          ),
          //当有手势下滑的时候就会显示 appBar。
          floating: false,
          //1.要保证 floating = true。
          //2.处理了放手后的行为，决定是要进入到展开还是收缩状态。
          snap: false,
          //appBar 不消失。
          pinned: true,
        ),
        SliverFixedExtentList(
          itemExtent: 50,
          delegate: SliverChildBuilderDelegate(
                    (context, index) => ListTile(title: Text('Item $index')), childCount: 50),
        )
      ],
    );
  }

}