import 'package:flutter/material.dart';
import 'package:mix/src/attributes/shared/shared.attributes.dart';
/// ## Widget:
/// - (all)
///
/// Utility functions and short utils are listed in [Static Methods](#static-methods)
///
/// {@category Utilities}
class SharedUtils {
  const SharedUtils._();

  static SharedAttributes animated({
    bool animated = true,
    Curve? curve,
    int? duration,
    Duration? asDuration,
  }) {
    return SharedAttributes(
      animated: animated,
      animationCurve: curve,
      animationDuration:
          // Prioritize duration in milliseconds
          duration != null ? Duration(milliseconds: duration) : asDuration,
    );
  }

  /// Short Utils: animationDuration
  static SharedAttributes animationDuration(int milliseconds) {
    return SharedAttributes(
      animationDuration: Duration(
        milliseconds: milliseconds,
      ),
    );
  }

  /// Short Utils: animationCurve
  static SharedAttributes animationCurve(Curve curve) {
    return SharedAttributes(
      animationCurve: curve,
    );
  }

  /// Short Utils: textDirection
  static SharedAttributes textDirection(TextDirection? textDirection) {
    return SharedAttributes(textDirection: textDirection);
  }

  /// Short Utils: visible
  static SharedAttributes visible([bool? condition = true]) =>
      SharedAttributes(visible: condition);

  /// Short Utils: hidden
  static SharedAttributes hidden([bool condition = true]) =>
      SharedAttributes(visible: !condition);
}
