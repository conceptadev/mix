import 'package:flutter/material.dart';
import 'package:mix/src/attributes/widgets/common/common.attributes.dart';

class CommonUtility {
  const CommonUtility._();

  static CommonAttributes animated({
    bool? animated = true,
    Curve? curve,
    Duration? duration,
  }) {
    return CommonAttributes(
      animated: animated,
      animationCurve: curve,
      animationDuration: duration,
    );
  }

  static CommonAttributes animationDuration(int milliseconds) {
    return CommonAttributes(
      animationDuration: Duration(
        milliseconds: milliseconds,
      ),
    );
  }

  static CommonAttributes animationCurve(Curve curve) {
    return CommonAttributes(
      animationCurve: curve,
    );
  }

  static CommonAttributes textDirection(TextDirection? textDirection) {
    return CommonAttributes(textDirection: textDirection);
  }
}
