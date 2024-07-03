import 'dart:math';

import 'package:flutter/material.dart';
import 'package:remix/components/spinner/spinner_spec.dart';

abstract interface class SpinnerPainter extends CustomPainter {
  final Animation<double>? animation;
  final SpinnerSpec spec;

  SpinnerPainter({
    this.animation,
    required this.spec,
  }) : super(repaint: animation);
}

class DottedSpinnerPainter extends SpinnerPainter {
  DottedSpinnerPainter({
    super.animation,
    required super.spec,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final specStrokeWidth = spec.strokeWidth ?? 1;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2 * specStrokeWidth;

    canvas.translate(size.width / 2, size.height / 2);

    final radius = min(size.width, size.height) / 2 - paint.strokeWidth;
    const lines = 12;
    const lineAngle = 2 * pi / lines;

    for (int i = 0; i < lines; i++) {
      final angle = i * lineAngle;
      final opacity = (lines - i + animation!.value * lines) % lines / lines;

      paint.color = spec.color.withOpacity(opacity);

      final lineHeight = radius * 0.45;

      canvas.drawLine(
        Offset(radius * 0.9 * cos(angle), radius * 0.9 * sin(angle)),
        Offset(lineHeight * cos(angle), lineHeight * sin(angle)),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(DottedSpinnerPainter oldDelegate) => true;
}

class SolidSpinnerPainter extends SpinnerPainter {
  SolidSpinnerPainter({
    super.animation,
    required super.spec,
  });

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
