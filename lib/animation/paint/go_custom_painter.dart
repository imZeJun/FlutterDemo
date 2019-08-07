import 'package:flutter/material.dart';
import 'dart:math';

class GoCustomPainterWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: GoCustomPainter(),
        size: Size(300, 300),
      ),
    );
  }
}

class GoCustomPainter extends CustomPainter {

  static const GRID_NUM = 12;

  @override
  void paint(Canvas canvas, Size size) {
    var goWidth = min(size.width, size.height);
    //1.绘制背景。
    Paint paint = new Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromLTWH(0, 0, goWidth, goWidth), paint);
    paint.color = Colors.black;
    for (int i = 0; i <= GRID_NUM; i++) {
      var index = goWidth / GRID_NUM * i;
      //绘制横线。
      canvas.drawLine(Offset(0, index), Offset(goWidth, index), paint);
      //绘制竖线。
      canvas.drawLine(Offset(index, 0), Offset(index, goWidth), paint);
    }
    for (int i = 0; i < 8; i++) {
      _drawDots(canvas, paint..color = Colors.white, goWidth);
      _drawDots(canvas, paint..color = Colors.black, goWidth);
    }
  }

  _drawDots(Canvas canvas, Paint paint, var goWidth) {
    Random random = new Random();
    var unit = goWidth / GRID_NUM;
    var whiteX = unit * (1 + random.nextInt(GRID_NUM - 2));
    var whiteY = unit * (1 + random.nextInt(GRID_NUM - 2));
    canvas.drawCircle(Offset(whiteX, whiteY), 5, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}