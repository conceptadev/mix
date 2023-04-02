import 'package:flutter/material.dart';

import 'shared.attributes.dart';

class CommonUtility {
  const CommonUtility._();

  static SharedWidgetAttributes animation({
    Curve? curve,
    int? duration,
    Duration? asDuration,
  }) {
    return SharedWidgetAttributes(
      animated: true,
      animationCurve: curve,
      animationDuration:
          // Prioritize duration in milliseconds
          duration != null ? Duration(milliseconds: duration) : asDuration,
    );
  }

  static SharedWidgetAttributes animationDuration(int milliseconds) {
    return SharedWidgetAttributes(
      animated: true,
      animationDuration: Duration(
        milliseconds: milliseconds,
      ),
    );
  }

  static SharedWidgetAttributes animationCurve(Curve curve) {
    return SharedWidgetAttributes(
      animated: true,
      animationCurve: curve,
    );
  }

  static SharedWidgetAttributes textDirection(TextDirection? textDirection) {
    return SharedWidgetAttributes(textDirection: textDirection);
  }

  static SharedWidgetAttributes visible([bool? condition = true]) =>
      SharedWidgetAttributes(visible: condition);

  static SharedWidgetAttributes hidden([bool condition = true]) =>
      SharedWidgetAttributes(visible: !condition);
}
