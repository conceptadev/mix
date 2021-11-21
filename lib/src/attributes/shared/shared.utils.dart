import 'package:flutter/material.dart';
import 'package:mix/src/attributes/shared/shared.attributes.dart';

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

  static SharedAttributes animationDuration(int milliseconds) {
    return SharedAttributes(
      animationDuration: Duration(
        milliseconds: milliseconds,
      ),
    );
  }

  static SharedAttributes animationCurve(Curve curve) {
    return SharedAttributes(
      animationCurve: curve,
    );
  }

  static SharedAttributes textDirection(TextDirection? textDirection) {
    return SharedAttributes(textDirection: textDirection);
  }

  /// Visible utility
  static SharedAttributes visible([bool? condition = true]) =>
      SharedAttributes(visible: condition);

  /// Hidden utility
  static SharedAttributes hidden([bool condition = false]) =>
      SharedAttributes(visible: !condition);
}
