import 'package:flutter/material.dart';

import 'common.attributes.dart';

class CommonUtility {
  const CommonUtility._();

  static CommonAttributes animated({
    bool animated = true,
    Curve? curve,
    int? duration,
    Duration? asDuration,
  }) {
    return CommonAttributes(
      animated: animated,
      animationCurve: curve,
      animationDuration:
          // Prioritize duration in milliseconds
          duration != null ? Duration(milliseconds: duration) : asDuration,
    );
  }

  /// Short Utils: animationDuration
  static CommonAttributes animationDuration(int milliseconds) {
    return CommonAttributes(
      animationDuration: Duration(
        milliseconds: milliseconds,
      ),
    );
  }

  /// Short Utils: animationCurve
  static CommonAttributes animationCurve(Curve curve) {
    return CommonAttributes(
      animationCurve: curve,
    );
  }

  /// Short Utils: textDirection
  static CommonAttributes textDirection(TextDirection? textDirection) {
    return CommonAttributes(textDirection: textDirection);
  }

  /// Short Utils: visible
  static CommonAttributes visible([bool? condition = true]) =>
      CommonAttributes(visible: condition);

  /// Short Utils: hidden
  static CommonAttributes hidden([bool condition = true]) =>
      CommonAttributes(visible: !condition);
}
