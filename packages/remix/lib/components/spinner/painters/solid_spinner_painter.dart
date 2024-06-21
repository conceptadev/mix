import 'dart:math';

import 'package:flutter/material.dart';
import 'package:remix/components/spinner/spinner_spec.dart';

class SolidSpinnerPainter extends CustomPainter {
  final Animation<double>? animation;
  final SpinnerSpec spec;

  SolidSpinnerPainter({
    this.animation,
    required this.spec,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final specStrokeWidth = spec.strokeWidth ?? 1;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2 * specStrokeWidth
      ..color = spec.color;

    canvas.translate(size.width / 2, size.height / 2);

    final radius = min(size.width, size.height) / 2 - paint.strokeWidth;
    const startAngle = pi / 3;
    const sweepAngle = 2 * pi / 3;

    canvas.drawArc(
      Rect.fromCircle(center: Offset.zero, radius: radius),
      startAngle + animation!.value * 2 * pi,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(SolidSpinnerPainter oldDelegate) => true;
}
