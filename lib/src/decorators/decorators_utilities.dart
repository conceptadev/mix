import 'package:flutter/material.dart';

import '../../mix.dart';

class DecoratorUtility {
  static FlexibleDecorator flex(int value) {
    return FlexibleDecorator(flex: value);
  }

  static FlexibleDecorator flexFit(FlexFit flexFit) {
    return FlexibleDecorator(flexFit: flexFit);
  }

  static FlexibleDecorator expanded() {
    return const FlexibleDecorator(flexFit: FlexFit.tight);
  }

  static FlexibleDecorator flexible() {
    return const FlexibleDecorator(flexFit: FlexFit.loose);
  }

  static AspectRatioDecorator aspectRatio(double aspectRatio) {
    return AspectRatioDecorator(aspectRatio: aspectRatio);
  }

  static ClipDecorator clipRounded(double radius) {
    return ClipDecorator(
      ClipDecoratorType.rounded,
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static ScaleDecorator scale(double scale) {
    return ScaleDecorator(scale);
  }

  static ClipDecorator clipOval() {
    return const ClipDecorator(ClipDecoratorType.oval);
  }

  static ClipDecorator clipTriangle() {
    return const ClipDecorator(ClipDecoratorType.triangle);
  }

  static OpacityDecorator opacity(double opacity) {
    return OpacityDecorator(opacity: opacity);
  }

  static RotateDecorator rotate(int quarterTurns) {
    return RotateDecorator(quarterTurns: quarterTurns);
  }

  static RotateDecorator rotate90() => rotate(1);
  static RotateDecorator rotate180() => rotate(2);
  static RotateDecorator rotate270() => rotate(3);
}
