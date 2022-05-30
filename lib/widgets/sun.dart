import 'package:flutter/material.dart';

class Sun extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final sunColor = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    canvas.drawCircle(const Offset(0.0, 0.0), 50.0, sunColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
