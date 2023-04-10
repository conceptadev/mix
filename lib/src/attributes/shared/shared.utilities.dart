import 'package:flutter/material.dart';

import 'shared.attributes.dart';

class CommonUtility {
  const CommonUtility._();

  static SharedStyleAttributes animation({
    Curve? curve,
    int? duration,
    Duration? asDuration,
  }) {
    return SharedStyleAttributes(
      animated: true,
      animationCurve: curve,
      animationDuration:
          // Prioritize duration in milliseconds
          duration != null ? Duration(milliseconds: duration) : asDuration,
    );
  }

  static SharedStyleAttributes animationDuration(int milliseconds) {
    return SharedStyleAttributes(
      animated: true,
      animationDuration: Duration(
        milliseconds: milliseconds,
      ),
    );
  }

  static SharedStyleAttributes animationCurve(Curve curve) {
    return SharedStyleAttributes(
      animated: true,
      animationCurve: curve,
    );
  }

  static SharedStyleAttributes textDirection(TextDirection? textDirection) {
    return SharedStyleAttributes(textDirection: textDirection);
  }

  static SharedStyleAttributes visible([bool? condition = true]) =>
      SharedStyleAttributes(visible: condition);

  static SharedStyleAttributes hidden([bool condition = true]) =>
      SharedStyleAttributes(visible: !condition);
}
