import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/common.attributes.dart';

class AnimationUtility {
  const AnimationUtility();

  CommonAttributes animated({
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

  CommonAttributes animationDuration(int milliseconds) {
    return CommonAttributes(
      animationDuration: Duration(
        milliseconds: milliseconds,
      ),
    );
  }

  CommonAttributes animationCurve(Curve curve) {
    return CommonAttributes(
      animationCurve: curve,
    );
  }
}
