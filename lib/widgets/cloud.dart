import 'package:flutter/material.dart';

class Cloud extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cloudColor = Paint()
      ..color = Colors.grey.shade900
      ..style = PaintingStyle.fill;

    var path = Path()
      ..moveTo(35, 50)
      // ..moveTo(350, 150)
      ..lineTo(-35, 50)
      ..lineTo(-35, 20)
      ..lineTo(35, 20)
      ..lineTo(35, 50)
      ..close();

    canvas.drawPath(path, cloudColor);
    canvas.drawCircle(const Offset(-35, 30), 20, cloudColor);
    canvas.drawCircle(const Offset(0, 10), 30, cloudColor);
    canvas.drawCircle(const Offset(35, 25), 25, cloudColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
