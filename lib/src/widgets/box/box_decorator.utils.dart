import 'package:flutter/material.dart';
import 'box_decorators/aspect_ratio.dart';
import 'box_decorators/clip_decorator.dart';
import 'box_decorators/flexible.dart';
import 'box_decorators/opacity.dart';
import 'box_decorators/rotate.dart';
import 'box_decorators/scale.dart';

class BoxDecoratorUtility {
  /// Short Utils: flex
  static FlexibleDecorator flex(int value) {
    return FlexibleDecorator(flex: value);
  }

  /// Short Utils: flexFit
  static FlexibleDecorator flexFit(FlexFit flexFit) {
    return FlexibleDecorator(flexFit: flexFit);
  }

  /// Short Utils: expanded
  static FlexibleDecorator expanded() {
    return const FlexibleDecorator(flexFit: FlexFit.tight);
  }

  /// Short Utils: flexible
  static FlexibleDecorator flexible() {
    return const FlexibleDecorator(flexFit: FlexFit.loose);
  }

  static AspectRatioDecorator aspectRatio(double aspectRatio) {
    return AspectRatioDecorator(aspectRatio: aspectRatio);
  }

  /// Short Utils: clipRounded
  static ClipDecorator clipRounded(double radius) {
    return ClipDecorator(
      ClipDecoratorType.rounded,
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static ScaleDecorator scale(double scale) {
    return ScaleDecorator(scale);
  }

  /// Short Utils: clipOval
  static ClipDecorator clipOval() {
    return const ClipDecorator(ClipDecoratorType.oval);
  }

  /// Short Utils: clipTriangle
  static ClipDecorator clipTriangle() {
    return const ClipDecorator(ClipDecoratorType.triangle);
  }

  static OpacityDecorator opacity(double opacity) {
    return OpacityDecorator(opacity: opacity);
  }

  /// Short Utils: rotate
  static RotateDecorator rotate(int quarterTurns) {
    return RotateDecorator(quarterTurns: quarterTurns);
  }

  /// Short Utils: rotate90
  static rotate90() => rotate(1);

  /// Short Utils: rotate180
  static rotate180() => rotate(2);

  /// Short Utils: rotate270
  static rotate270() => rotate(3);

  /// Short Utils: Rotate 360
  static rotate360() => rotate(4);
}
