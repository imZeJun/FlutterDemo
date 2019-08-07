import 'package:flutter/material.dart';

class SliverNestedWidget extends StatelessWidget {

  final _tabs = ['最新', '最热'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: SliverAppBar(
                bottom: TabBar(tabs: _tabs.map((title) => Container(height: 50, alignment: Alignment.center,child: Text(title, style: TextStyle(fontSize: 18)))).toList()),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset("images/weather.jpg", fit: BoxFit.fill),
                  collapseMode: CollapseMode.parallax,
                ),
                forceElevated: innerBoxIsScrolled,
                elevation: 10,
                expandedHeight: 150,
                pinned: true,
              ),
            )
          ], 
          body: TabBarView(children: _tabs.map((title) => Builder(
            builder: (context) =>
                CustomScrollView(
                  key: PageStorageKey(title),
                  slivers: <Widget>[
                    SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
                    SliverFixedExtentList(
                      itemExtent: 50,
                      delegate: SliverChildBuilderDelegate(
                              (context, index) => ListTile(title: Text('Item $index')), childCount: 50),
                    )
                  ],),
          )).toList()))
    );
  }
  
}