import 'package:flutter/material.dart';

void main() => runApp(AnimationWidget());

class AnimationWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("RecognizerWidget")),
        body: StaggerDemo(),
      ),
    );
  }
}

class ScaleAnimationDemo extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ScaleAnimationDemoState();
  }

}

class _ScaleAnimationDemoState
    extends State<ScaleAnimationDemo>
    with SingleTickerProviderStateMixin {
  
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration : const Duration(seconds: 3), vsync: this);
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(
        child : Image.asset("images/sync_queue.png"),
        animation: animation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}

class AnimatedImage extends AnimatedWidget {

  AnimatedImage({Key key, Animation<double> animation})
      : super(key : key, listenable : animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Image.asset(
        "images/sync_queue.png",
        width: animation.value,
        height: animation.value,
      ),
    );
  }

}

class GrowTransition extends StatelessWidget {

  final Widget child;
  final Animation<double> animation;

  GrowTransition({this.child, this.animation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Container(
              height: animation.value,
              width: animation.value,
              child: child,
            );
          },
        child: child,
      ),
    );
  }

}

class StaggerDemo extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _StaggerDemoState();
  }
}

class _StaggerDemoState extends State<StaggerDemo> with TickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 2000),
        vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        playAnimation();
      },
      child: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            border: Border.all(
              color: Colors.black.withOpacity(0.5)
            )
          ),
          child: StaggerAnimation(controller: _controller),
        ),
      ),
    );
  }

  void playAnimation() async {
    try {
      //先正向执行动画。
      await _controller.forward().orCancel;
      //再反向执行动画。
      await _controller.reverse().orCancel;
    } on TickerCanceled {

    }
  }
}

class StaggerAnimation extends StatelessWidget {

  final Animation<double> controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  StaggerAnimation({Key key, this.controller}) : super(key : key) {
    height = Tween<double>(begin : 0, end : 300)
        .animate(CurvedAnimation(
          parent: controller,
          curve: Interval(0.0, 0.6, curve: Curves.ease)));
    color = ColorTween(begin : Colors.green, end : Colors.red)
        .animate(CurvedAnimation(
          parent: controller,
          curve: Interval(0.0, 0.6, curve: Curves.ease)));
    padding = Tween<EdgeInsets>(
        begin : EdgeInsets.only(left: 0), end: EdgeInsets.only(left: 100.0))
        .animate(CurvedAnimation(
          parent: controller,
          curve: Interval(0.6, 1.0, curve: Curves.ease)));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return Container(
          alignment: Alignment.center,
          padding: padding.value,
          child: Container(
            color: color.value,
            width: 50,
            height: height.value,
          ),
        );
      },
      animation: controller,
    );
  }

}