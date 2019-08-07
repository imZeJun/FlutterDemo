import 'package:flutter/material.dart';
import 'go_custom_painter.dart';
import 'dash_board_painter.dart';

void main() => runApp(CustomPainterWidget());

class CustomPainterWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("SimplePainter")),
        body: CanvasAnimateWidget(),
      ),
    );
  }
}

class SimplePainterWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: SimplePainter(),
      ),
    );
  }
}

class SimplePainter extends CustomPainter {

  Paint painter = Paint()..color = Colors.blue
    ..style = PaintingStyle.fill
    ..strokeCap = StrokeCap.butt
    ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(0, 0), 40, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}