import 'package:flutter/material.dart';
import 'package:mix/src/decorators/widget_decorators/aspect_ratio.dart';
import 'package:mix/src/decorators/widget_decorators/clip_decorator.dart';
import 'package:mix/src/decorators/widget_decorators/flexible.dart';
import 'package:mix/src/decorators/widget_decorators/opacity.dart';
import 'package:mix/src/decorators/widget_decorators/rotate.dart';
import 'package:mix/src/decorators/widget_decorators/scale.dart';

/// ## Widget:
/// - (All)
///
/// Utility functions and short utils are listed in [Static Methods](#static-methods)
///
/// {@category Utilities}
class ScaleDecoratorUtility {
  /// Short Utils: scale
  static ScaleDecorator scale(double scale) => ScaleDecorator(scale);
}

/// ## Widget:
/// - (All)
///
/// Utility functions and short utils are listed in [Static Methods](#static-methods)
///
/// {@category Utilities}
class RotateDecoratorUtility {
  /// Short Utils: rotate
  static RotateDecorator rotate(int quarterTurns) =>
      RotateDecorator(quarterTurns: quarterTurns);

  /// Short Utils: rotate90
  static rotate90() => rotate(1);

  /// Short Utils: rotate180
  static rotate180() => rotate(2);

  /// Short Utils: rotate270
  static rotate270() => rotate(3);

  /// Short Utils: Rotate 360
  static rotate360() => rotate(4);
}

/// ## Widget:
/// - (All)
///
/// Utility functions and short utils are listed in [Static Methods](#static-methods)
///
/// {@category Utilities}
class OpacityDecoratorUtility {
  /// Short Utils: opacity
  static OpacityDecorator opacity(double opacity) =>
      OpacityDecorator(opacity: opacity);
}

/// ## Widget:
/// - (All)
///
/// Utility functions and short utils are listed in [Static Methods](#static-methods)
///
/// {@category Utilities}
class FlexibleDecoratorUtility {
  /// Short Utils: flex
  static FlexibleDecorator flex(int value) => FlexibleDecorator(flex: value);

  /// Short Utils: flexFit
  static FlexibleDecorator flexFit(FlexFit flexFit) =>
      FlexibleDecorator(flexFit: flexFit);

  /// Short Utils: expanded
  static FlexibleDecorator expanded() =>
      const FlexibleDecorator(flexFit: FlexFit.tight);

  /// Short Utils: flexible
  static FlexibleDecorator flexible() =>
      const FlexibleDecorator(flexFit: FlexFit.loose);
}

/// ## Widget:
/// - (All)
///
/// Utility functions and short utils are listed in [Static Methods](#static-methods)
///
/// {@category Utilities}
class AspectRatioDecoratorUtility {
  /// Short Utils: aspectRatio
  static AspectRatioDecorator aspectRatio(double aspectRatio) =>
      AspectRatioDecorator(aspectRatio: aspectRatio);
}

/// ## Widget:
/// - (All)
///
/// Utility functions and short utils are listed in [Static Methods](#static-methods)
///
/// {@category Utilities}
class ClipDecoratorUtility {
  /// Short Utils: clipRounded
  static ClipDecorator clipRounded(double radius) {
    return ClipDecorator(
      ClipDecoratorType.rounded,
      borderRadius: BorderRadius.circular(radius),
    );
  }

  /// Short Utils: clipOval
  static ClipDecorator clipOval() {
    return const ClipDecorator(ClipDecoratorType.oval);
  }

  /// Short Utils: clipTriangle
  static ClipDecorator clipTriangle() {
    return const ClipDecorator(ClipDecoratorType.triangle);
  }
}
