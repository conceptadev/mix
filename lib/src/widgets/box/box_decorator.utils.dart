import 'package:flutter/material.dart';

import '../../../mix.dart';

class BoxDecoratorUtility {
  /// Short Utils: flex
  static BoxAttributes flex(int value) {
    return BoxUtility.decorator(
      FlexibleDecorator(flex: value),
    );
  }

  /// Short Utils: flexFit
  static BoxAttributes flexFit(FlexFit flexFit) {
    return BoxUtility.decorator(
      FlexibleDecorator(flexFit: flexFit),
    );
  }

  /// Short Utils: expanded
  static BoxAttributes expanded() {
    return BoxUtility.decorator(
      const FlexibleDecorator(flexFit: FlexFit.tight),
    );
  }

  /// Short Utils: flexible
  static BoxAttributes flexible() {
    return BoxUtility.decorator(
      const FlexibleDecorator(flexFit: FlexFit.loose),
    );
  }

  static BoxAttributes aspectRatio(double aspectRatio) {
    return BoxUtility.decorator(
      AspectRatioDecorator(aspectRatio: aspectRatio),
    );
  }

  /// Short Utils: clipRounded
  static BoxAttributes clipRounded(double radius) {
    return BoxUtility.decorator(
      ClipDecorator(
        ClipDecoratorType.rounded,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  static BoxAttributes scale(double scale) {
    return BoxUtility.decorator(ScaleDecorator(scale));
  }

  /// Short Utils: clipOval
  static BoxAttributes clipOval() {
    return BoxUtility.decorator(const ClipDecorator(ClipDecoratorType.oval));
  }

  /// Short Utils: clipTriangle
  static BoxAttributes clipTriangle() {
    return BoxUtility.decorator(
      const ClipDecorator(ClipDecoratorType.triangle),
    );
  }

  static BoxAttributes opacity(double opacity) {
    return BoxUtility.decorator(OpacityDecorator(opacity: opacity));
  }

  /// Short Utils: rotate
  static BoxAttributes rotate(int quarterTurns) {
    return BoxUtility.decorator(RotateDecorator(quarterTurns: quarterTurns));
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
