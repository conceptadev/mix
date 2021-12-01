import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/mixer/mixer.dart';

RotateWidgetAttribute rotate(int quarterTurns) {
  return RotateWidgetAttribute(quarterTurns: quarterTurns);
}

/// Rotate 90
rotate90() => rotate(1);

/// Rotate 180
rotate180() => rotate(2);

/// Rotate 270
rotate270() => rotate(3);

/// Rotate 360
rotate360() => rotate(4);

class RotateWidgetAttribute
    extends ParentWidgetDecorator<RotateWidgetAttribute> {
  final int quarterTurns;
  const RotateWidgetAttribute({required this.quarterTurns});

  @override
  RotateWidgetAttribute merge(RotateWidgetAttribute other) {
    return RotateWidgetAttribute(
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
