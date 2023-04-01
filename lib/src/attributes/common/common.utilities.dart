import 'package:flutter/material.dart';

import 'common.attributes.dart';

class CommonUtility {
  const CommonUtility._();

  static CommonAttributes animation({
    Curve? curve,
    int? duration,
    Duration? asDuration,
  }) {
    return CommonAttributes(
      animated: true,
      animationCurve: curve,
      animationDuration:
          // Prioritize duration in milliseconds
          duration != null ? Duration(milliseconds: duration) : asDuration,
    );
  }

  static CommonAttributes animationDuration(int milliseconds) {
    return CommonAttributes(
      animated: true,
      animationDuration: Duration(
        milliseconds: milliseconds,
      ),
    );
  }

  static CommonAttributes animationCurve(Curve curve) {
    return CommonAttributes(
      animated: true,
      animationCurve: curve,
    );
  }

  static CommonAttributes textDirection(TextDirection? textDirection) {
    return CommonAttributes(textDirection: textDirection);
  }

  static CommonAttributes visible([bool? condition = true]) =>
      CommonAttributes(visible: condition);

  static CommonAttributes hidden([bool condition = true]) =>
      CommonAttributes(visible: !condition);
}
