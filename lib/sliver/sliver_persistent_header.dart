import 'package:flutter/material.dart';

class SliverPersistentHeaderWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
            delegate: CustomPersistentHeaderDel(
                max: 300,
                min: 100,
                child: Container(
                  color: Colors.pink,
                  alignment: Alignment.center,
                  child: Text('background', style: TextStyle(background: Paint()..color = Colors.blue)),
                )
            ),
            floating: true,
            pinned: true,
        ),
        SliverFillRemaining(
          child: Center(child: Text("list....")),
        )
      ],
    );
  }

}

class CustomPersistentHeaderDel extends SliverPersistentHeaderDelegate {

  final double max;
  final double min;
  final Widget child;

  CustomPersistentHeaderDel({this.max, this.min, this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) => child;

  @override
  bool shouldRebuild(CustomPersistentHeaderDel oldDelegate) {
    max != oldDelegate.max || min != oldDelegate.min || child != oldDelegate.child;
  }

  @override
  double get maxExtent => max;

  @override
  double get minExtent => min;
}