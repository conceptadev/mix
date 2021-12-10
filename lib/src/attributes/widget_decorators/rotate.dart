import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/mixer/mix_context.dart';

RotateDecorator rotate(int quarterTurns) {
  return RotateDecorator(quarterTurns: quarterTurns);
}

/// Rotate 90
rotate90() => rotate(1);

/// Rotate 180
rotate180() => rotate(2);

/// Rotate 270
rotate270() => rotate(3);

/// Rotate 360
rotate360() => rotate(4);

class RotateDecorator extends ParentWidgetDecorator<RotateDecorator> {
  final int quarterTurns;
  const RotateDecorator({required this.quarterTurns});

  @override
  RotateDecorator merge(RotateDecorator other) {
    return RotateDecorator(
      quarterTurns: other.quarterTurns,
    );
  }

  @override
  Widget render(MixContext mixContext, Widget child) {
    return RotatedBox(
      quarterTurns: quarterTurns,
      child: child,
    );
  }
}
