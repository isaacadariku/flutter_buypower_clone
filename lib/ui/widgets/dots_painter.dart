import 'dart:math';

import 'package:flutter/material.dart';

/// The dots painter is for painting the dots and the circle at the center
class DotsPainter extends CustomPainter {
  final double circleRadius;
  final double dotsRadius;

  const DotsPainter({this.circleRadius = 20.0, this.dotsRadius = 3});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    const angle = 2 * pi / 9;
    final radius = size.width / 2;

    // canvas.translate(radius, radius);
    final colors = [
      Colors.green,
      Colors.pink,
      Colors.greenAccent,
      Colors.red,
      Colors.grey,
      Colors.orangeAccent,
      Colors.blue,
      Colors.yellowAccent,
      Colors.deepPurple,
      Colors.teal,
    ];
    // standard-size = 20, small = 9
    canvas.drawCircle(
      Offset(radius, radius),
      circleRadius,
      paint..color = Colors.grey,
    );

    canvas.translate(radius, radius);
    for (int i = 0; i < 10; i++) {
      canvas.rotate(angle);
      // standard-radius = 3, animation = 7
      canvas.drawCircle(
        Offset(0, radius / dotsRadius),
        3,
        paint..color = colors[i],
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
