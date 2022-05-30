import 'package:flutter/material.dart';

class Rain extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rainColor = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    var path1 = Path()
      ..moveTo(25, 55)
      ..lineTo(15, 75)
      ..lineTo(14, 73)
      ..lineTo(24, 53)
      ..lineTo(25, 55)
      ..close();

    canvas.drawPath(path1, rainColor);

    var path2 = Path()
      ..moveTo(5, 55)
      ..lineTo(-5, 75)
      ..lineTo(-6, 73)
      ..lineTo(4, 53)
      ..lineTo(5, 55)
      ..close();

    canvas.drawPath(path2, rainColor);

    var path3 = Path()
      ..moveTo(-15, 55)
      ..lineTo(-25, 75)
      ..lineTo(-26, 73)
      ..lineTo(-16, 53)
      ..lineTo(-15, 55)
      ..close();

    canvas.drawPath(path3, rainColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
